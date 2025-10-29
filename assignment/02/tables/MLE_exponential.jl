include("../parameteric_estimates.jl")

open("./report/src/tables/MLE_exponential.tex"; truncate=true) do table
    format = Dict{Any,Any}(
        Float64 => x -> latexstring(round(x; sigdigits=2))
    )
    write(table, latex_table(MLE_exponential_table; format))
end
