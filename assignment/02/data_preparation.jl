using DataFrames, CSV, Query

csv = CSV.read("./Data set SKE_VeteranClinicTrial_modif-RC_final5 1.csv", DataFrame)

# Filtering non useful columns
select!(csv, Not(map(name -> all(ismissing.(csv[!, name])), names(csv))))
select!(csv, Not(["Column13", "Column14", "Column15", "Column16"]))

# Selecting data columns and adding names based on their contents
data = csv[!, ["treat", "cell", "survt", "cens", "KAR", "didur", "age", "prith"]] |> dropmissing
@assert nrow(data) == 137
groups = csv[!, "Column12"] |> skipmissing |> collect
column_explanations = csv[[2, 4:13...], "01SKE 2023"]

# My Groups ((disease duration didur<=9 (months) versus didur>9 (months) při treat=2))

A = @from i in data begin
    @where i.treat == 2
    @where i.didur <= 9
    @select i
    @collect DataFrame
end
A[!, "survt_c1"] = map(eachrow(A[!, ["survt", "cens"]])) do (t, c)
    c == 1 ? t : Missing()
end
A[!, "survt_c0"] = map(eachrow(A[!, ["survt", "cens"]])) do (t, c)
    c == 0 ? t : Missing()
end
A_T = A[!, "survt"]

B = @from i in data begin
    @where i.treat == 2
    @where i.didur > 9
    @select i
    @collect DataFrame
end
B[!, "survt_c1"] = map(eachrow(B[!, ["survt", "cens"]])) do (t, c)
    c == 1 ? t : Missing()
end
B[!, "survt_c0"] = map(eachrow(B[!, ["survt", "cens"]])) do (t, c)
    c == 0 ? t : Missing()
end
B_T = B[!, "survt"]
