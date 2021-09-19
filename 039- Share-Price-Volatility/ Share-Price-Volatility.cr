#! /usr/bin/crystal

# $ ameba slayfer1112.cr
# Inspecting 1 file.
# .
# Finished in 8.48 milliseconds
# $ crystal build slayfer1112.cr

def data_entry()
  data = File.read("DATA.lst")
  values = [] of Array(String)
  data.each_line do |x|
    inter = [] of String
    (x.split).each do |y|
      inter << y
    end
    values << inter
  end
  values[1..]
end

def mean(array)
  sum = 0
  array.each do |x|
    sum += x
  end
  mean = sum / array.size
  mean
end

def solution(array)
  share = array[0]
  prices = [] of Int32
  array[1..].each do |x|
    x = x.to_i
    prices << x
  end
  darr = [] of Float64
  m = mean(prices)
  prices.each do |x|
    a = (m-x)**2
    darr << a
  end
  m = m*0.01
  d = mean(darr)**0.5
  if d >= m*4
    print "#{share} "
  end
end

data = data_entry()
data.each do |x|
  solution(x)
end
puts

# $ ./slayfer1112
# <Result>