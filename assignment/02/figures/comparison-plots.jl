using Makie, Distributions
include("../parameteric_estimates.jl")

col_wong = Makie.wong_colors()

fig_comp_R = Figure()
ax_comp_R = Axis(fig_comp_R[1, 1])

lines!(ax_comp_R, 0 .. last(A_KM.times), x -> ccdf(A_exp_MLE, x); color=col_wong[1], label=L"R_A")
lines!(ax_comp_R, 0 .. last(B_KM.times), x -> ccdf(B_exp_MLE, x); color=col_wong[3], label=L"R_B")
ax_comp_R.xlabel = L"t"
axislegend(ax_comp_R, position=:rt)

include("../save_fig.jl")(fig_comp_R, "comp_R", ".")

fig_comp_λ = Figure()
ax_comp_λ = Axis(fig_comp_λ[1, 1])

lines!(ax_comp_λ, 0 .. last(A_KM.times), x -> pdf(A_exp_MLE, x) / ccdf(A_exp_MLE, x); color=col_wong[1], label=L"\lambda_A")
lines!(ax_comp_λ, 0 .. last(B_KM.times), x -> pdf(B_exp_MLE, x) / ccdf(B_exp_MLE, x); color=col_wong[3], label=L"\lambda_B")
ax_comp_λ.xlabel = L"t"
axislegend(ax_comp_λ, position=:rc)

include("../save_fig.jl")(fig_comp_λ, "comp_λ", ".")

fig_comp_Λ = Figure()
ax_comp_Λ = Axis(fig_comp_Λ[1, 1])

lines!(ax_comp_Λ, 0 .. last(A_KM.times), x -> -log(ccdf(A_exp_MLE, x)); color=col_wong[1], label=L"\Lambda_A")
lines!(ax_comp_Λ, 0 .. last(B_KM.times), x -> -log(ccdf(B_exp_MLE, x)); color=col_wong[3], label=L"\Lambda_B")
ax_comp_Λ.xlabel = L"t"
axislegend(ax_comp_Λ, position=:lt)

include("../save_fig.jl")(fig_comp_Λ, "comp_Λ", ".")
