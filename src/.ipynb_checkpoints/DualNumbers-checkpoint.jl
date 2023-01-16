module DualNumbers

"""
     Dual: a dual number
"""
struct Dual{T}
    real::T
    dual::T
end

Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)
Base.:-(x::Dual, y::Dual) = Dual(x.real - y.real, x.dual - y.dual)

end # module DualNumbers
