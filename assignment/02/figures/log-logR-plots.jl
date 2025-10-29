using Makie

include("../parameteric_estimates.jl")

col_wong = Makie.wong_colors()

fig_log_log_R = Figure()
ax_log_log_R = Axis(fig_log_log_R[1, 1])

stairs!(ax_log_log_R, [0, A_KM.times...], log.(-log.([1 - eps(), risk.(A_KM, A_KM.times[begin:end-1])..., eps()])); step=:post, label=L"(\log-\log)_A")
stairs!(ax_log_log_R, [0, B_KM.times...], log.(-log.([1 - eps(), risk.(B_KM, B_KM.times[begin:end-1])..., eps()])); step=:post, label=L"(\log-\log)_B")
ax_log_log_R.xlabel = L"t"
limits!(ax_log_log_R, 0, last(A_KM.times), -4, 1.5)
axislegend(ax_log_log_R, position=:rb)

include("../save_fig.jl")(fig_log_log_R, "log_log_R", ".")


