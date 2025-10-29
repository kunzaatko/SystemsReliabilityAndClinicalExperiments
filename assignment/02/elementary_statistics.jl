using StatsBase, DataFrames, LaTeXStrings

include("./data_preparation.jl")
include("./LaTeX_table.jl")

struct Std <: Real
    value::Float64
end

nomiss(x) = x |> skipmissing |> collect
stats = (
    (L"\#", "survt") => x -> length(nomiss(x)),
    (L"\sum \delta", "cens") => x -> sum(nomiss(x)),
    (L"\mathop{E}\delta", "cens") => x -> mean(nomiss(x)),
    (L"\overline{X^{(1)}_n}", "survt_c1") => x -> mean(nomiss(x)),
    (L"\std(X^{(1)})", "survt_c1") => x -> std(nomiss(x)),
    (L"\overline{X^{(0)}_n}", "survt_c0") => x -> mean(nomiss(x)),
    (L"\std(X^{(0)})", "survt_c0") => x -> std(nomiss(x)),
    (L"\min(X^{(1)})", "survt_c1") => x -> minimum(nomiss(x)),
    # (L"Q_1", "survt_c1") => x -> quantile(nomiss(x), 0.25),
    # (L"Q_2", "survt_c1") => x -> quantile(nomiss(x), 0.5),
    # (L"Q_3", "survt_c1") => x -> quantile(nomiss(x), 0.75),
    (L"\max(X^{(1)})", "survt_c1") => x -> maximum(nomiss(x)))

stats_table = DataFrame()
stats_table[!, "Group"] = [L"A", L"B"]

for (stat, func) in stats
    stats_table[!, stat[1]] = [func(A[!, stat[2]]), func(B[!, stat[2]])]
end

