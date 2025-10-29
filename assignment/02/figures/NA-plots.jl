using Makie
include("../parameteric_estimates.jl")

col_wong = Makie.wong_colors()

fig_NA_A = Figure()
ax_NA_A = Axis(fig_NA_A[1, 1])

scatter!(ax_NA_A, A_NA.times, Λ.(A_NA, A_NA.times); color=map(x -> x == 1 ? col_wong[1] : :red, A_NA.status), markersize=15, marker=map(x -> x == 1 ? 'o' : 'x', A_NA.status),
    label=L"\Lambda_\text{N}")
lines!(ax_NA_A, 0 .. last(A_NA.times), x -> -log(ccdf(A_exp_MLE, x)); color=col_wong[2], label=L"\Lambda_\text{MLE (Exp)}")
ax_NA_A.xlabel = L"t"
axislegend(ax_NA_A, position=:rt)

include("../save_fig.jl")(fig_NA_A, "NA_A", ".")

fig_NA_B = Figure()
ax_NA_B = Axis(fig_NA_B[1, 1])

scatter!(ax_NA_B, B_NA.times, Λ.(B_NA, B_NA.times); color=map(x -> x == 1 ? col_wong[1] : :red, B_NA.status), markersize=15, marker=map(x -> x == 1 ? 'o' : 'x', B_NA.status),
    label=L"\Lambda_\text{N}")
lines!(ax_NA_B, 0 .. last(B_NA.times), x -> -log(ccdf(B_exp_MLE, x)); color=col_wong[2], label=L"\Lambda_\text{MLE (Exp)}")
ax_NA_B.xlabel = L"t"
axislegend(ax_NA_B, position=:rt)

include("../save_fig.jl")(fig_NA_B, "NA_B", ".")
