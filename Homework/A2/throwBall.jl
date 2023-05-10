import Plots
using Plots

#pre-define constants
h = 1.5
g = 9.8
v0 = 4
v1 = 6
θ = 45

#time vector
t = collect(0:0.001:1)

x0(t) = v0*cos(θ*π/180)*t # x(t)=v*cos(θ*π/180)*.t
y0(t) = h+v0*sin(θ*π/180)*t-1/2*g*t^2 # y(t)=h+v*sin(θ*π/180)*t-1/2*g.*t.^2

distance = x0.(t)
height = y0.(t)


#index of negative heights
indexNegativeHeight = findall(x0->x0<0, y0.(t))

print("The ball hit the ground at the distance of ")
print(distance[indexNegativeHeight[1]]," meters")

plot(distance,height,title="Ball trajectory", xlabel = "distance(m)",ylabel = "Ball height(m)")
plot!(distance,zeros(size(distance)), line=:dash, color=:black)

savefig("BallTrajectory")

x1(t) = v1*cos(θ*π/180)*t # x(t)=v*cos(θ*π/180)*.t
y1(t) = h+v1*sin(θ*π/180)*t-1/2*g*t^2 # y(t)=h+v*sin(θ*π/180)*t-1/2*g.*t.^2

distance1 = x1.(t)
height1 = y1.(t)

plot!(distance1, height1, color =:red, ylabel = "v1")