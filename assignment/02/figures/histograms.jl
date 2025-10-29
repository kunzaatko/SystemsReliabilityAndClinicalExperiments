using Makie, ColorSchemes, DataFrames

include("../data_preparation.jl")

fig_hists = Figure()
ax_hists = Axis(fig_hists[1, 1]; yticklabelsvisible=false)

col_wong = Makie.wong_colors()
col_red = ColorSchemes.Reds[3:end]

nomiss(x) = x |> skipmissing |> collect
stephist!(ax_hists, nomiss(A[!, "survt_c1"]); color=col_wong[1], normalization=:pdf, label=L"A^{(1)}")
# stephist!(ax_hists, nomiss(A[!, "survt_c0"]); color=col_red[3], normalization=:pdf, label=L"A^{(0)}")
scatter!(ax_hists, nomiss(A[!, "survt_c1"]), zeros(length(nomiss(A[!, "survt_c1"]))); color=col_wong[1], marker=:vline, label=L"A^{(1)}")
scatter!(ax_hists, nomiss(A[!, "survt_c0"]), zeros(length(nomiss(A[!, "survt_c0"]))); color=col_red[1], marker=:vline, label=L"A^{(0)}")

stephist!(ax_hists, nomiss(B[!, "survt_c1"]); color=col_wong[3], normalization=:pdf, label=L"B^{(1)}")
# stephist!(ax_hists, nomiss(B[!, "survt_c0"]); color=col_red[4], normalization=:pdf, label=L"(B^{(0)}")
scatter!(ax_hists, nomiss(B[!, "survt_c1"]), zeros(length(nomiss(B[!, "survt_c1"]))); color=col_wong[3], marker=:vline, label=L"B^{(1)}")
scatter!(ax_hists, nomiss(B[!, "survt_c0"]), zeros(length(nomiss(B[!, "survt_c0"]))); color=col_red[2], marker=:vline, label=L"B^{(0)}")

axislegend(ax_hists; position=:rt)

include("../save_fig.jl")(fig_hists, "histograms", ".")
