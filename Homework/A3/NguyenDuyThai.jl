### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 60f60c90-c3b8-11ed-3cec-0d0118dceff9
using DelimitedFiles

# ╔═╡ 78d51168-a046-401d-bda9-793eb207efa2
A = readdlm("D:/University/DT Coding/ML Julia/A3/fuel.txt", ',')

# ╔═╡ fa5c4e60-993c-4015-8e36-676da3e9a66f
fuelC = A[2:end, 3]

# ╔═╡ 3cf0ef74-4bb5-44b6-99fe-3c41682433a2
pop = A[2:end, end - 1]

# ╔═╡ 2cbdd533-15c1-4dee-a074-861af8f3a963
tax = float.(A[2:end, end])

# ╔═╡ aaf446e3-70ef-48c4-8b87-8a0bf9b913bc
income = float.(A[2:end, 4])

# ╔═╡ 674a295b-728b-4a45-93a1-6656569c36f5
fuel = 1000 .* fuelC ./ pop

# ╔═╡ ccb466ff-1202-4a10-b8e8-a5f093ee5d0e
drivers = A[2:end, 2]

# ╔═╡ 5fe19ce3-f240-4909-86e1-187fdde26837
Dlic = 1000 .* drivers ./ pop

# ╔═╡ 1892806f-58c9-4f24-9b5e-2abdbb653ccc
miles = A[2:end, 5]

# ╔═╡ 00a667fe-b4c8-41df-99d5-eacc2b6a70ed
logMiles = float.(log2.(miles))

# ╔═╡ a9ee12d6-38d1-4f33-a298-d38e761445fe
N = length(fuel)

# ╔═╡ f5a9a555-be47-41e9-864b-107ad15a1aac
X = [ones(N) tax Dlic income logMiles]

# ╔═╡ d20c81ae-8590-4746-ac13-2595d8de9b66
train(X,y) = inv(X'*X)*X'*y

# ╔═╡ e7763059-7e7c-4131-9dfb-7bdba7eb8976
θ = train(X, fuel)

# ╔═╡ c0bfd930-8337-45ff-98fd-74cca0ce093c


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
# ╠═60f60c90-c3b8-11ed-3cec-0d0118dceff9
# ╠═78d51168-a046-401d-bda9-793eb207efa2
# ╠═fa5c4e60-993c-4015-8e36-676da3e9a66f
# ╠═3cf0ef74-4bb5-44b6-99fe-3c41682433a2
# ╠═2cbdd533-15c1-4dee-a074-861af8f3a963
# ╠═aaf446e3-70ef-48c4-8b87-8a0bf9b913bc
# ╠═674a295b-728b-4a45-93a1-6656569c36f5
# ╠═ccb466ff-1202-4a10-b8e8-a5f093ee5d0e
# ╠═5fe19ce3-f240-4909-86e1-187fdde26837
# ╠═1892806f-58c9-4f24-9b5e-2abdbb653ccc
# ╠═00a667fe-b4c8-41df-99d5-eacc2b6a70ed
# ╠═a9ee12d6-38d1-4f33-a298-d38e761445fe
# ╠═f5a9a555-be47-41e9-864b-107ad15a1aac
# ╠═d20c81ae-8590-4746-ac13-2595d8de9b66
# ╠═e7763059-7e7c-4131-9dfb-7bdba7eb8976
# ╠═c0bfd930-8337-45ff-98fd-74cca0ce093c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
