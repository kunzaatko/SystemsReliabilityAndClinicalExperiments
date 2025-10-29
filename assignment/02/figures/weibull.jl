using Makie, Distributions
include("../parameteric_estimates.jl")

fig_hists_A = Figure()
ax_hists_A = Axis(fig_hists_A[1, 1]; yticklabelsvisible=false)

col_wong = Makie.wong_colors()

nomiss(x) = x |> skipmissing |> collect
stephist!(ax_hists_A, nomiss(A[!, "survt_c1"]); color=col_wong[1], normalization=:pdf, label=L"\hat{f}_H")
scatter!(ax_hists_A, nomiss(A[!, "survt_c1"]), zeros(length(nomiss(A[!, "survt_c1"]))); color=col_wong[2], marker=:vline, label=L"A^{(1)}")
lines!(ax_hists_A, range(extrema(nomiss(A[!, "survt_c1"]))..., length=1000), x -> pdf(A_weib_MLE, x); color=col_wong[3], label=L"\hat{f}_\text{MLE}")

axislegend(ax_hists_A; position=:rt)

include("../save_fig.jl")(fig_hists_A, "histogram_vs_parametric_weib_A", ".")

fig_QQ_A = Figure()
ax_QQ_A = Axis(fig_QQ_A[1, 1]; yticklabelsvisible=false, xticklabelsvisible=false)

lines!(ax_QQ_A, nomiss(A[!, "survt_c1"]), identity; color=:black, label="Q-Q line")
scatter!(ax_QQ_A, quantile.(A_weib_MLE, 1 .- risk.(A_KM, A_KM.times)), A_KM.times; color=col_wong[1])
ax_QQ_A.ylabel = L"t_{(j)}"
ax_QQ_A.xlabel = L"F_{\text{MLE (Weibull)}}^{-1}(\hat{F}_\text{KM}(t_{(j)}))"
# qqplot!(ax_QQ_A, Weibull(A_weib_MLE...), nomiss(A[!, "survt_c1"]))
axislegend(ax_QQ_A, position=:lt)

include("../save_fig.jl")(fig_QQ_A, "QQ_weib_A", ".")

fig_PP_A = Figure()
ax_PP_A = Axis(fig_PP_A[1, 1]; yticklabelsvisible=false, xticklabelsvisible=false)

lines!(ax_PP_A, 0 .. 1, identity; color=:black, label="P-P line")
scatter!(ax_PP_A, 1 .- risk.(A_KM, A_KM.times), cdf.(A_weib_MLE, A_KM.times))
ax_PP_A.xlabel = L"\hat{P}_\text{KM}(t_{(j)})"
ax_PP_A.ylabel = L"\hat{P}_\text{MLE (Weibull)}(t_{(j)})"
axislegend(ax_PP_A, position=:lt)

include("../save_fig.jl")(fig_PP_A, "PP_weibull_A", ".")

fig_hists_B = Figure()
ax_hists_B = Axis(fig_hists_B[1, 1]; yticklabelsvisible=false)

stephist!(ax_hists_B, nomiss(B[!, "survt_c1"]); color=col_wong[1], normalization=:pdf, label=L"\hat{f}_H")
scatter!(ax_hists_B, nomiss(B[!, "survt_c1"]), zeros(length(nomiss(B[!, "survt_c1"]))); color=col_wong[2], marker=:vline, label=L"B^{(1)}")
lines!(ax_hists_B, range(extrema(nomiss(B[!, "survt_c1"]))..., length=1000), x -> pdf(B_weib_MLE, x); color=col_wong[3], label=L"\hat{f}_\text{MLE}")

axislegend(ax_hists_B; position=:rt)

include("../save_fig.jl")(fig_hists_B, "histogram_vs_parametric_weib_B", ".")

fig_QQ_B = Figure()
ax_QQ_B = Axis(fig_QQ_B[1, 1]; yticklabelsvisible=false, xticklabelsvisible=false)

lines!(ax_QQ_B, nomiss(B[!, "survt_c1"]), identity; color=:black, label="Q-Q line")
scatter!(ax_QQ_B, quantile.(B_weib_MLE, 1 .- risk.(B_KM, B_KM.times)), B_KM.times; color=col_wong[2])
# qqplot!(ax_QQ_B, Weibull(B_weib_MLE...), nomiss(B[!, "survt_c1"]))
ax_QQ_B.ylabel = L"t_{(j)}"
ax_QQ_B.xlabel = L"F_{\text{MLE (Weibull)}}^{-1}(\hat{F}_\text{KM}(t_{(j)}))"
axislegend(ax_QQ_B, position=:lt)

include("../save_fig.jl")(fig_QQ_B, "QQ_weib_B", ".")

fig_PP_B = Figure()
ax_PP_B = Axis(fig_PP_B[1, 1]; yticklabelsvisible=false, xticklabelsvisible=false)

lines!(ax_PP_B, 0 .. 1, identity; color=:black, label="P-P line")
scatter!(ax_PP_B, 1 .- risk.(B_KM, B_KM.times), cdf.(B_weib_MLE, B_KM.times))
ax_PP_B.xlabel = L"\hat{P}_\text{KM}(t_{(j)})"
ax_PP_B.ylabel = L"\hat{P}_\text{MLE (Weibull)}(t_{(j)})"
axislegend(ax_PP_B, position=:lt)

include("../save_fig.jl")(fig_PP_B, "PP_weibull_B", ".")

λs_B = range((B_weib_MLE.θ .* (0.9, 1.1))...; length=200)
αs_B = range((B_weib_MLE.α .* (0.9, 1.1))...; length=200)
loglikes = [weib_loglikelihood(α, λ; data=B) for α in αs_B, λ in λs_B]
fig_loglikes_B, ax_loglikes_B, _ = surface(αs_B, λs_B, loglikes; axis=(; type=Axis3))
scatter!(ax_loglikes_B, Distributions.params(B_weib_MLE)..., weib_loglikelihood(Distributions.params(B_weib_MLE)...; data=B); markersize=6, label=L"(\hat{\alpha}, 1/\hat{\lambda}_\text{MLE})")
ax_loglikes_B.xlabel = L"α"
ax_loglikes_B.ylabel = L"(λ')^{-1}$"
ax_loglikes_B.zlabel = L"\ell_1"

# fig_loglikes_B[1, 2] = Legend(fig_loglikes_B, ax_loglikes_B)

include("../save_fig.jl")(fig_loglikes_B, "log_likelihood_surf_B", ".")

λs_A = range((A_weib_MLE.θ .* (0.9, 1.1))...; length=200)
αs_A = range((A_weib_MLE.α .* (0.9, 1.1))...; length=200)
loglikes = [weib_loglikelihood(α, λ; data=A) for α in αs_A, λ in λs_A]
fig_loglikes_A, ax_loglikes_A, _ = surface(αs_A, λs_A, loglikes; axis=(; type=Axis3))
scatter!(ax_loglikes_A, Distributions.params(A_weib_MLE)..., weib_loglikelihood(Distributions.params(A_weib_MLE)...; data=A); markersize=6, label=L"(\hat{\alpha}, 1/\hat{\lambda}_\text{MLE})")
ax_loglikes_A.xlabel = L"α"
ax_loglikes_A.ylabel = L"(λ')^{-1}$"
ax_loglikes_A.zlabel = L"\ell_1"

# fig_loglikes_A[1, 2] = Legend(fig_loglikes_A, ax_loglikes_A)

include("../save_fig.jl")(fig_loglikes_A, "log_likelihood_surf_A", ".")
