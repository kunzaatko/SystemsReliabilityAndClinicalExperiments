include("../elementary_statistics.jl")

open("./report/src/tables/stats.tex"; truncate=true) do table
    format = Dict{Any,Any}(
        Float64 => x -> latexstring(round(x; digits=2))
    )
    write(table, latex_table(stats_table; format))
end
