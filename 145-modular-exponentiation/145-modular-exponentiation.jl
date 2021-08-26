function exp_mod(a::Int64, b::Int64, m::Int64)
  z = a
  
  for i in 2:b
    z *= a
    z %= m
  end
  
  return z
end