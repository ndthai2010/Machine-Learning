### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 98ec6ad0-b72f-11ed-249a-45675a080c93
md"""
$p(y=k|x) = \propto{ p(x|y=k) * p(y=k)}{p(x)}$
$p([x_1, x_2, x_3, x_4] | y = k) * θ_k$
$\prod_{j=1}^D p(x_j| y = k) * θ_k$
$\prod_{j=1}^D p(x_j=1| y = k) * θ_k$
$\left [\prod_{j=1}^D \theta_{jk} \right ] * θ_k$
$\theta_{jk} = \frac{p(x_j=1, y=k)}{p(y=k)} = \frac{c(x_j=1,y=k)}{c(y=k)}$
posterior distribution $\propto$ [likelyhood distribution] * [prior distribution]
"""

# ╔═╡ 361afd39-9f78-4cec-b89d-93eea619562e
y = [1; 1; 2; 2; 2; 1; 2; 1]

# ╔═╡ c00c4adf-3893-4ef3-81dd-bc433bf58061
# p(y=1) = ? p(y=2) = ?

# ╔═╡ 4c99e54a-065f-4ca4-8f00-4f4bba9ccd19
θ = zeros(2)

# ╔═╡ 0093c0d7-66f0-4512-ad3b-0779b7e1f48c
N = length(y)

# ╔═╡ 74e18c83-4296-4d0e-8275-be10b6fb2a81
y .== 1

# ╔═╡ 4ab21850-822e-4de0-8e59-60413e098414
θ[1] = sum(y .== 1)/N

# ╔═╡ 62cc5192-39ca-4e4d-9bad-01edf8330689
θ[1] = sum(y .== 2)/N

# ╔═╡ 9e1282e0-5917-4701-a9b2-54cab8178ed2
X = [1 1 1 0;
        1 1 1 1;
        0 1 1 0;
        0 0 1 1;
        0 0 0 0;
        0 0 0 1;
        1 0 0 0;
        0 1 1 1;
]

# ╔═╡ 12603252-0b29-4f16-9dcd-11c74567eeff
y

# ╔═╡ 25489701-f904-4802-ab81-07f260287d71
id1 = (y .== 1)

# ╔═╡ 09cc90af-51ac-41a9-9506-c36d06a59104
X1 = X[id1, :]

# ╔═╡ e013b5e3-91a0-41cd-a2c5-ef9b78e2974a
sum(X1, dims=1)

# ╔═╡ 504bdb50-00b3-4d19-ae92-0ebea6ed7274
id2 = (y .== 2)

# ╔═╡ 300b9314-b8fd-4313-859e-b1ca759d944c
X2 = X[id2, :]

# ╔═╡ 8c0e645d-996f-44f2-8126-d405c9cd927e
sum(X2, dims=1)

# ╔═╡ d732ac3b-f0fe-4aed-88f4-1ab44528ecdb
unique(y)

# ╔═╡ b33407c1-1d5a-494a-802a-22e134b6bd0d
size(X)

# ╔═╡ 7c00187f-d0eb-418d-ad2d-603a65a01a70
function train(X, y)
	K = length(unique(y)) # number of labels
	N, D = size(X) # number of samples and domain dimensions
	θ_k = zeros(K)
	θ_jk = zeros(D, K)
	for k=1:K
		idk = (y .== k)
		θ_k[k] = sum(idk) 
		Xk = X[idk, :]
		θ_jk[:, k] = sum(Xk, dims=1) ./ θ_k[k]
	end
	θ_k = θ_k ./ N
	return θ_k, θ_jk
end

# ╔═╡ 20f536c4-7197-41fe-a07b-1c461ac8ae3d
θ_k, θ_jk = train(X, y)

# ╔═╡ 53f86263-86e3-41c8-9693-c1c4c9f8989c
function classify(θ_k, θ_jk, xNew)
	D, K = size(θ_jk)
	p = zeros(K) # log posterior distribution
	for k=1:K
		s = 0
		for j=1:D
			s = s + if (xNew[j] == 1) log(θ_jk[j, k]) else log(1 - θ_jk[j, k]) end
		end
		p[k] = log(θ[k]) + s
	end		
	return argmax(p)
end

# ╔═╡ d67fb0b0-cc01-4b18-8f81-1d118d4434fa
if (1 > 3) "a" else "b" end

# ╔═╡ 4fb611d8-213f-4f4b-be31-78981d0fa44d
xNew = [1; 0; 1; 0]

# ╔═╡ df86c9fc-875f-4900-a320-ffcb1cbc5f23
yNew = classify(θ_k,θ_jk, xNew)

# ╔═╡ 494ab57e-eae4-407a-bac9-95627492c67b
p = exp.(classify(θ_k,θ_jk, xNew)) * 2

# ╔═╡ d2e72292-5494-4fbb-bb1e-8b09f942da18
md"""
posterior distribution = $p(y=k|x) \propto \left [\prod_{j=1}^D \theta_{jk} \right ] * θ_k$
$\log p(y=k|x) \propto \left [\sum_{j=1}^D \log \theta_{jk} \right ] + \log θ_k$
"""

# ╔═╡ 78954829-b38d-41e2-990e-6e65f8f9aeda
v = rand(10)

# ╔═╡ 19c0d064-e911-45f2-b470-f8e27cbc05ba
u = rand(10)

# ╔═╡ e0308f7c-6d81-48c1-85f6-3e7f7acb26f2
u + v

# ╔═╡ 40b365a9-71f7-484b-b353-a7b8f9963115


# ╔═╡ 86c053c8-a53d-4002-ad5b-1738f3fda753
function predict(x⃗, θ_k, θ_jk)
	K = size(θ_jk)[2]
	θ_jk2 = deepcopy(θ_jk)
	θ_jk2[(x⃗ .== 1), :] = log.(θ_jk2[(x⃗ .== 1), :])
	θ_jk2[(x⃗ .== 0), :] = log.(1 .- θ_jk2[(x⃗ .== 0), :])
	v⃗ = sum.(eachcol(θ_jk2)) .+ log.(θ_k)
	return argmax(v⃗)
end

# ╔═╡ Cell order:
# ╠═98ec6ad0-b72f-11ed-249a-45675a080c93
# ╠═361afd39-9f78-4cec-b89d-93eea619562e
# ╠═c00c4adf-3893-4ef3-81dd-bc433bf58061
# ╠═4c99e54a-065f-4ca4-8f00-4f4bba9ccd19
# ╠═0093c0d7-66f0-4512-ad3b-0779b7e1f48c
# ╠═74e18c83-4296-4d0e-8275-be10b6fb2a81
# ╠═4ab21850-822e-4de0-8e59-60413e098414
# ╠═62cc5192-39ca-4e4d-9bad-01edf8330689
# ╠═9e1282e0-5917-4701-a9b2-54cab8178ed2
# ╠═12603252-0b29-4f16-9dcd-11c74567eeff
# ╠═25489701-f904-4802-ab81-07f260287d71
# ╠═09cc90af-51ac-41a9-9506-c36d06a59104
# ╠═e013b5e3-91a0-41cd-a2c5-ef9b78e2974a
# ╠═504bdb50-00b3-4d19-ae92-0ebea6ed7274
# ╠═300b9314-b8fd-4313-859e-b1ca759d944c
# ╠═8c0e645d-996f-44f2-8126-d405c9cd927e
# ╠═d732ac3b-f0fe-4aed-88f4-1ab44528ecdb
# ╠═b33407c1-1d5a-494a-802a-22e134b6bd0d
# ╠═7c00187f-d0eb-418d-ad2d-603a65a01a70
# ╠═20f536c4-7197-41fe-a07b-1c461ac8ae3d
# ╠═53f86263-86e3-41c8-9693-c1c4c9f8989c
# ╠═d67fb0b0-cc01-4b18-8f81-1d118d4434fa
# ╠═4fb611d8-213f-4f4b-be31-78981d0fa44d
# ╠═df86c9fc-875f-4900-a320-ffcb1cbc5f23
# ╠═494ab57e-eae4-407a-bac9-95627492c67b
# ╠═d2e72292-5494-4fbb-bb1e-8b09f942da18
# ╠═78954829-b38d-41e2-990e-6e65f8f9aeda
# ╠═19c0d064-e911-45f2-b470-f8e27cbc05ba
# ╠═e0308f7c-6d81-48c1-85f6-3e7f7acb26f2
# ╠═40b365a9-71f7-484b-b353-a7b8f9963115
# ╠═86c053c8-a53d-4002-ad5b-1738f3fda753
