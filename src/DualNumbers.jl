module DualNumbers

export Dual
"""
     Dual: a dual number
"""
struct Dual{T}
    real::T
    dual::T
end

#identity and negation
Base.:+(x::Dual) = Dual(+x.real, +x.dual)
Base.:-(x::Dual) = Dual(-x.real, -x.dual)

#binary operation 
Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)

#Base.:-(x::Dual, y::Dual) = Dual(x.real - y.real, x.dual - y.dual)
Base.:-(x::Dual, y::Dual) = x + -y

#scalar multiplication
Base.:*(a::Number, x::Dual) = Dual(a * x.real, a * x.dual)
Base.:*(x::Dual, a::Number) = Dual(x.real * a, x.dual * a)

#multiplication
#	x = a + eps b
#	y = c + eps d
#	eps^2 = 0
#
#	x * y = a*c + eps * (a*d + c*b )
Base.:*(x:Dual, y:Dual) = Dual(x.real * y.real, x.real * y.dual + x.dual * y.real)

#conjugate
Base.conj(x::real) = Dual(x.real,-x.dual)

#inverse
#	1/(a + eps b)
#	=(a - eps b)/[(a + eps b)(a - eps b)]
#	=(a - eps b)/a^2
#	=(a - eps b)*(1/a^2)
Base.inv(x::Dual) = conj(x) * (1/x.real^2)

#division
Base.:/(x::Dual, y::Dual) = x * inv(y)


end # module DualNumbers
