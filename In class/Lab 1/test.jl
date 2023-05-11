#] -> pkg, backspace -> julia 
#status to see packages
# add LinearAlgebra
# add DelimitedFiles
# add Pluto
# add statistic

using LinearAlgebra


s1 = "this is string"
typeof(s1)

v = rand(6)
u = rand(5)
println(u')
println(u)

A = rand(10, 10) #tao ma tran 4x5 random
B = rand(10,10)
println("in ra $s1")

sum(A)
sum(v)
sum(A, dims=1) #Chieu cua vector dau ra

size(A)

A*B

string("I dont know but ", 10, " are too few")

#v[0] loi
v[1]

println(length(v))
println(size(v))
v = rand(10)
println(v)
v[1:5]
v[1:2:10]
v[1:3:10]
v[[1,3,6]]

idx = [1, 3, 7]
v[idx]

a = [1, 2, 4 ,6.4] #vector cot
b = [1 4 5 8 6]#vector hang
U = [1 2 4; 4 3 6; 5 6 8] #Ma tran
U2 = [3;5;6;7;8] #vector cot
println(U)
U[:,1]
U[2,:]

println(A)
A[2,[1, 5, 7]]

#Tong duong cheo chinh 
global sumA = 0
for i=1:3
    global sumA += U[i,i]
end
println(sumA)


# rc = zip(r, c)
# collect(rc)

# eyes(8)

f(x) = 2*x + 1
f(3)
f(3.5)

g(x) = f(2*x)
g(2)

a = [1, 2, 3]
#f(a)
f.(a)

A = rand(2, 3)
f.(A)

println(A)
A.*2

α(x) = 2*x + 5 #\alpha tab
α(59)
β(x) = x
β(57)

A = rand(5, 5)
I(5)

A*I(5) # dot product
A .* I(5) #nhan tung phan tu voi nhau

#Pluto.run()