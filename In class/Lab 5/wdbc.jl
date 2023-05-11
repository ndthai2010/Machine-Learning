### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 34461db0-bcbb-11ed-115b-21f1109cc07f
using DelimitedFiles

# ╔═╡ baea37f3-7c87-44b8-a314-93189fe6b1e3
using Statistics

# ╔═╡ ecb9a652-172e-4c70-ba40-190b2501aa70
wdbcPath = "D:/University/DT Coding/Machine-Learning/Datasets/wdbc.txt"

# ╔═╡ a4357b2c-d726-4561-b2f2-47e28e31fc95
A = readdlm(wdbcPath, ',', String)

# ╔═╡ 06167b12-3b86-4566-82d5-1d99af784eb5
function readData(path)
	A = readdlm(path, ',', String)
	y = Int.(A[:,2])
	X = A[:,3:12]
	(X, y)
end

# ╔═╡ 93365887-508c-4228-b892-02cf035f1e4f
X, y = readData(wdbcPath)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "f8aed8cc7ec98e25caba5c40ea614d484439ba58"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═34461db0-bcbb-11ed-115b-21f1109cc07f
# ╠═baea37f3-7c87-44b8-a314-93189fe6b1e3
# ╠═ecb9a652-172e-4c70-ba40-190b2501aa70
# ╠═a4357b2c-d726-4561-b2f2-47e28e31fc95
# ╠═06167b12-3b86-4566-82d5-1d99af784eb5
# ╠═93365887-508c-4228-b892-02cf035f1e4f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
