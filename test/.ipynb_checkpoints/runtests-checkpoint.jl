using DualNumbers
using Test

x = Dual(1,2)
y = Dual(2,3)

z = x + y
@test z == Dual(3,5)
