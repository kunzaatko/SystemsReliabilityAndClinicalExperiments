using LaTeXStrings, Optim

include("data_preparation.jl")
include("LaTeX_table.jl")

# Exponential
MLE_exponential_table = DataFrame(
    L"Group" => [L"A", L"B"],
    L"\hat{\lambda}_\text{ML}" => map([A, B]) do df
        length(df[!, "cens"]) / sum(df[!, "survt"])
    end
)

A_exp_MLE = Exponential(1 / MLE_exponential_table[1, 2])
B_exp_MLE = Exponential(1 / MLE_exponential_table[2, 2])

# Weibull
weib_loglikelihood(α, Λ; data, d=sum(data[!, "cens"])) = d * log(inv(Λ)) + d * log(α) + (α - 1) * sum(log.(skipmissing(data[!, "survt_c1"]))) -
                                                         inv(Λ) * sum(data[!, "survt"] .^ α)

# FIX: Does not work
function MLE_weib(data)
    opt = optimize(p -> -weib_loglikelihood(p[1], p[2]; data), [0.0, 0.0], [2, 70], [0.58, 50])
    args = Optim.minimizer(opt)
    return args[1], args[2]
end

A_weib_MLE = Weibull(MLE_weib(A)...)
B_weib_MLE = Weibull(MLE_weib(B)...)

struct KaplanMeier{T<:Real}
    times::Vector{T}
    status::Vector{Bool}
    function KaplanMeier(times, status)
        @assert length(times) == length(status)
        I = sortperm(times)
        return new{eltype(times)}(times[I], status[I])
    end
end
Broadcast.broadcastable(km::KaplanMeier) = Ref(km)

A_KM = KaplanMeier(A[!, "survt"], A[!, "cens"])
B_KM = KaplanMeier(B[!, "survt"], B[!, "cens"])

function risk(km::KaplanMeier{T}, x::Real) where {T}
    R = 1
    n = length(km.times)
    for (j, (t, c)) in enumerate(zip(km.times, km.status))
        if t > x
            break
        elseif t <= x && c
            R *= (n - j) / (n - j + 1)
        end
    end
    return R
end

function choose_exp(data; mode=:pp)
    fig = Figure()
    slg = SliderGrid(fig[2, 1], (label=L"\lambda", range=0.001:0.0001:0.05))
    exp = @lift(Exponential(1 / $(slg.sliders[1].value)))
    km = KaplanMeier(data[!, "survt"], data[!, "cens"])
    if mode == :pp
        ax, _ = scatter(fig[1, 1], 1 .- risk.(km, km.times), @lift(cdf.($(exp), km.times)))
        lines!(ax, 0 .. 1, identity; color=:black)
    elseif mode == :qq
        ax, _ = scatter(fig[1, 1], km.times, @lift(quantile.($(exp), 1 .- risk.(km, km.times))))
        lines!(ax, km.times, identity; color=:black)
    end
    # qqplot(fig[1, 1], weib, nomiss(A[!, "survt_c1"]); qqline=:identity)
    return fig
end

function choose_weib(data; mode=:pp)
    fig = Figure()
    slg = SliderGrid(fig[2, 1], (label=L"\alpha", range=0.001:0.001:1), (label=L"\theta", range=0.01:0.01:1000))
    weib = @lift(Weibull($(slg.sliders[1].value), $(slg.sliders[2].value)))
    km = KaplanMeier(data[!, "survt"], data[!, "cens"])
    if mode == :pp
        ax, _ = scatter(fig[1, 1], 1 .- risk.(km, km.times), @lift(cdf.($(weib), km.times)))
        lines!(ax, 0 .. 1, identity; color=:black)
    elseif mode == :qq
        ax, _ = scatter(fig[1, 1], km.times, @lift(quantile.($(weib), 1 .- risk.(km, km.times))))
        lines!(ax, km.times, identity; color=:black)
    end
    # qqplot(fig[1, 1], weib, nomiss(A[!, "survt_c1"]); qqline=:identity)
    return fig
end

struct NelsonAalen{T<:Real}
    times::Vector{T}
    status::Vector{Bool}
    function NelsonAalen(times, status)
        @assert length(times) == length(status)
        I = sortperm(times)
        return new{eltype(times)}(times[I], status[I])
    end
end
Broadcast.broadcastable(na::NelsonAalen) = Ref(na)

function Λ(na::NelsonAalen, x::Real)
    accum = 0
    n = length(na.times)
    for (j, (t, c)) in enumerate(zip(na.times, na.status))
        if t > x
            break
        elseif t <= x && c
            accum += 1 / (n - j + 1)
        end
    end
    return accum
end

A_NA = NelsonAalen(A[!, "survt"], A[!, "cens"])
B_NA = NelsonAalen(B[!, "survt"], B[!, "cens"])
