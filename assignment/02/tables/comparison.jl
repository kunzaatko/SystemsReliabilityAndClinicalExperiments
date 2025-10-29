using DataFrames
include("../parameteric_estimates.jl")

comparison_table = DataFrame(
    "Group" => ["A", "B"],
    L"MTTF" => map(e -> 1 * e.θ, [A_exp_MLE, B_exp_MLE]),
    L"t_\text{med}" => map(e -> log(2) * e.θ, [A_exp_MLE, B_exp_MLE])
)

open("./report/src/tables/comparison.tex"; truncate=true) do table
    format = Dict{Any,Any}(
        Float64 => x -> latexstring(round(x; sigdigits=2))
    )
    write(table, latex_table(comparison_table; format))
end
