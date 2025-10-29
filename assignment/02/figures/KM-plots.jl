using Makie, Distributions
include("../parameteric_estimates.jl")

col_wong = Makie.wong_colors()

fig_KM_A = Figure()
ax_KM_A = Axis(fig_KM_A[1, 1])

stairs!(ax_KM_A, [0, A_KM.times...], risk.(A_KM, [0, A_KM.times...]); step=:post, label=L"\hat{R}_{KM}")
scatter!(ax_KM_A, A_KM.times, risk.(A_KM, A_KM.times); color=map(x -> x == 1 ? col_wong[1] : :red, A_KM.status), markersize=15, marker=map(x -> x == 1 ? 'o' : 'x', A_KM.status))
lines!(ax_KM_A, 0 .. last(A_KM.times), x -> ccdf(A_exp_MLE, x); color=col_wong[2], label=L"R_\text{MLE (Exp)}")
ax_KM_A.xlabel = L"t"
axislegend(ax_KM_A, position=:rt)

include("../save_fig.jl")(fig_KM_A, "KM_A", ".")


fig_KM_B = Figure()
ax_KM_B = Axis(fig_KM_B[1, 1])

stairs!(ax_KM_B, [0, B_KM.times...], risk.(B_KM, [0, B_KM.times...]); step=:post, label=L"\hat{R}_{KM}")
scatter!(ax_KM_B, B_KM.times, risk.(B_KM, B_KM.times); color=map(x -> x == 1 ? col_wong[1] : :red, B_KM.status), markersize=15, marker=map(x -> x == 1 ? 'o' : 'x', B_KM.status))
lines!(ax_KM_B, 0 .. last(B_KM.times), x -> ccdf(B_exp_MLE, x); color=col_wong[2], label=L"R_\text{MLE (Exp)}")
ax_KM_B.xlabel = L"t"
axislegend(ax_KM_B, position=:rt)

include("../save_fig.jl")(fig_KM_B, "KM_B", ".")

fig_KM_AB = Figure()
ax_KM_AB = Axis(fig_KM_AB[1, 1])


stairs!(ax_KM_AB, [0, A_KM.times...], risk.(A_KM, [0, A_KM.times...]); step=:post, label=L"\hat{R}^{(A)}_{KM}")
scatter!(ax_KM_AB, A_KM.times, risk.(A_KM, A_KM.times); color=map(x -> x == 1 ? col_wong[1] : :red, A_KM.status), markersize=15, marker=map(x -> x == 1 ? 'o' : 'x', A_KM.status))

stairs!(ax_KM_AB, [0, B_KM.times...], risk.(B_KM, [0, B_KM.times...]); step=:post, label=L"\hat{R}^{(B)}_{KM}")
scatter!(ax_KM_AB, B_KM.times, risk.(B_KM, B_KM.times); color=map(x -> x == 1 ? col_wong[1] : :red, B_KM.status), markersize=15, marker=map(x -> x == 1 ? 'o' : 'x', B_KM.status))

ax_KM_AB.xlabel = L"t"

axislegend(ax_KM_AB, position=:rt)

include("../save_fig.jl")(fig_KM_AB, "KM_AB", ".")
