### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 029c6ff0-ddb1-11ed-1832-ede6af1aa181
using DelimitedFiles

# ╔═╡ ace5a351-ce5c-4c59-9644-95b450051aa2
wine = "D:/University/DT Coding/Machine-Learning/Datasets/X_wine_data.txt"

# ╔═╡ a5615310-cf48-420e-84f0-7bb805101863
A = readdlm(wine)

# ╔═╡ 0008d9e7-df25-4384-914d-00c28ec2a126
path = "D:/University/DT Coding/Machine-Learning/Datasets/Y_wine_data.txt"

# ╔═╡ 825caa94-1ecb-4e2d-9ea5-92b6f82fc9f2
B = readdlm(path)

# ╔═╡ fe8422e4-a3c6-4c57-837a-c2d8dc4ea43b
function readData(path)
	A = readdlm(path)
	y = float.(A[1:end,end])
	X = float.([ones(length(y)) A[1:end, 1:end-1]])
	return X, y
end

# ╔═╡ 61d23afe-b8b8-40ae-b078-7a3db58055c3
X, y = readData(wine)

# ╔═╡ 1aa64678-6d00-4c64-aaea-7a2493fc4f44
function train(X,y)
	return inv(X'*X)*X'*y
end

# ╔═╡ ec09aba5-bc6b-4f11-a547-23ef111a8d6c
θ = train(X,y)

# ╔═╡ d8dff737-12d0-4307-95cd-16f1977c2a19


# ╔═╡ 864fc4b3-7cc3-444c-b1c6-d9ad48a9257c


# ╔═╡ e3e17183-74be-4c65-905c-4fec3257339c


# ╔═╡ 7dbd6bba-3dbc-494e-9d5b-98278d796812


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "739f2f3af706c750957bd6ec39e0874ba8eb265d"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╠═029c6ff0-ddb1-11ed-1832-ede6af1aa181
# ╠═ace5a351-ce5c-4c59-9644-95b450051aa2
# ╠═a5615310-cf48-420e-84f0-7bb805101863
# ╠═0008d9e7-df25-4384-914d-00c28ec2a126
# ╠═825caa94-1ecb-4e2d-9ea5-92b6f82fc9f2
# ╠═fe8422e4-a3c6-4c57-837a-c2d8dc4ea43b
# ╠═61d23afe-b8b8-40ae-b078-7a3db58055c3
# ╠═1aa64678-6d00-4c64-aaea-7a2493fc4f44
# ╠═ec09aba5-bc6b-4f11-a547-23ef111a8d6c
# ╠═d8dff737-12d0-4307-95cd-16f1977c2a19
# ╠═864fc4b3-7cc3-444c-b1c6-d9ad48a9257c
# ╠═e3e17183-74be-4c65-905c-4fec3257339c
# ╠═7dbd6bba-3dbc-494e-9d5b-98278d796812
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
