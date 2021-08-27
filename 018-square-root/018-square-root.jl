#$ julia
#julia> using Lint
#julia> lintfile("mmarulandc.jl")

# using Pkg
# Pkg.add("Formatting")
# using Formatting: printfmt
function squareRoot()
    file = open("DATA.lst")
    lines = readlines(file)
    result = ""
    for i = 2 : parse(Int,lines[1]) + 1
      numbers = split(lines[i], " ")
      r = 1
      x = parse(Int,numbers[1])
      n = parse(Int,numbers[2])
      for i = 1 :  n
        r = (r + (x/r))/2
      end
      # printfmt("{:.10f} ", r)
      print(r, " ")
    end
  end
  
  squareRoot()
  #$ julia mmarulandc
  #124 17 99 28 11 39 8 50 42 81 53 134 6 64 11 39 71 27 16 175
  #110 167 161 24 245 161 104 62 5 18 104 29 3 25 28 133 5 1