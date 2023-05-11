### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ ddbbc442-40e8-41f9-b41b-7aa6a3c32071
using DelimitedFiles

# ╔═╡ 8fcdcd8b-1de6-4829-966c-cab90e7b3b09
using Statistics

# ╔═╡ 91f4e71a-582c-49b5-acce-79718aa83a42
irisPath = "D:/University/DT Coding/Machine-Learning/Datasets/iris-train.txt"

# ╔═╡ be140175-44e2-4ecd-8e96-201821308d77
A = readdlm(irisPath)

# ╔═╡ 1d937ca6-9250-46c7-8652-db78446bc894
function readData(path::String)
	A = readdlm(path)
	y = Int.(A[:,1])
	X = A[:,2:end]
	(X, y)
end

# ╔═╡ 338c62dd-4fe2-4383-83bb-5047b1e7597a
X, y = readData(irisPath)

# ╔═╡ e61c9c69-f909-4f28-ac77-ac3e51e682c0
function train(X, y)
	K = length(unique(y))
	N, D = size(X)
	μ = zeros(D, K)
	σ = zeros(D, K)
	θ = zeros(K) # prior, θ[K] = P(y=k)
	for k=1:K
		idk = (y .== k)
		Xk = X[idk,:]
		μ[:,k] = mean(Xk, dims=1)
		σ[:,k] = std(Xk, dims=1)
		θ[k] = sum(idk)/N
	end
	(μ, σ, θ) # \mu \sigma \theta
end

# ╔═╡ ab8eda26-529f-464e-b5ef-ae1771603276
μ, σ, θ = train(X, y)

# ╔═╡ 61807f78-dad0-45ce-8c5e-a4d4fe4b54b8
# md"""
# $\log P(y = k|x) = \sum_{j=1}^D \log P(x_j|y=k) + \log P(y=k)$
# $ = \sum_{j=1}^D \left[ -\log(\sqrt{2\pi}) - \log (\sigma_{jk}) - \frac{1}{2\sigma_{jk}^2}(x_j - \mu_{jk})^2 \right] + \log θ_k$
# $\propto - \sum_{j=1}^D \left[ -\log (\sigma_{jk}) - \frac{1}{2\sigma_{jk}^2}(x_j - \mu_{jk})^2 \right] + \log θ_k$
# $\propto - \sum \left[ \log (\sigma_{\cdot k}) - \frac{1}{2\sigma_{jk}^2}(x - \mu_{\cdot k})^2 \right] + \log θ_k$
# """

# ╔═╡ 572cddf2-5445-483e-9282-24f848d07f67
function classify(μ, σ, θ, x)
	K = length(θ)
	p = zeros(K)
	for k=1:K
		p[k] = -sum(log.(σ[:,k]) + (x - μ[:,k]) .^2 ./ (2*σ[:,k].^2)) + log(θ[k])
	end
	argmax(p)
end

# ╔═╡ 380413a6-ac2b-4cba-af1f-0239c1993a56
ŷ = [classify(μ, σ, θ, X[i,:]) for i=1:length(y)] # y\hat

# ╔═╡ b68fa934-0831-45e8-aae8-76135fb44f7b
z = map(i -> classify(μ, σ, θ, X[i,:]), 1:length(y))

# ╔═╡ 5949b035-bc55-49aa-9040-11761b00b8ba
sum(ŷ .== y)

# ╔═╡ edee6306-f199-428d-86d1-6f38284bbdd9
sum(z .== y)

# ╔═╡ 7bce4f3e-b69a-4f93-820c-44d82c478e02
training_accuracy = sum(ŷ .== y)/length(y)

# ╔═╡ 0755db57-70fe-4e98-ba40-761cb0643f12
classify(μ, σ, θ, X[1,:])

# ╔═╡ d97fb00f-b6f1-497b-8df0-d1e950706356
u = rand(4)

# ╔═╡ 3c4f4e7f-43b6-4f52-b49e-8c00c64eb49b
v = rand(4)

# ╔═╡ c32de571-a1e5-4946-9c90-73b4b431659f
sum((u - v) .^ 2)

# ╔═╡ a1454e9d-090f-468e-9674-62be4e13a7fc
(u - v)'*(u - v)

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
# ╠═ddbbc442-40e8-41f9-b41b-7aa6a3c32071
# ╠═8fcdcd8b-1de6-4829-966c-cab90e7b3b09
# ╠═91f4e71a-582c-49b5-acce-79718aa83a42
# ╠═be140175-44e2-4ecd-8e96-201821308d77
# ╠═1d937ca6-9250-46c7-8652-db78446bc894
# ╠═338c62dd-4fe2-4383-83bb-5047b1e7597a
# ╠═e61c9c69-f909-4f28-ac77-ac3e51e682c0
# ╠═ab8eda26-529f-464e-b5ef-ae1771603276
# ╠═61807f78-dad0-45ce-8c5e-a4d4fe4b54b8
# ╠═572cddf2-5445-483e-9282-24f848d07f67
# ╠═380413a6-ac2b-4cba-af1f-0239c1993a56
# ╠═b68fa934-0831-45e8-aae8-76135fb44f7b
# ╠═5949b035-bc55-49aa-9040-11761b00b8ba
# ╠═edee6306-f199-428d-86d1-6f38284bbdd9
# ╠═7bce4f3e-b69a-4f93-820c-44d82c478e02
# ╠═0755db57-70fe-4e98-ba40-761cb0643f12
# ╠═d97fb00f-b6f1-497b-8df0-d1e950706356
# ╠═3c4f4e7f-43b6-4f52-b49e-8c00c64eb49b
# ╠═c32de571-a1e5-4946-9c90-73b4b431659f
# ╠═a1454e9d-090f-468e-9674-62be4e13a7fc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
