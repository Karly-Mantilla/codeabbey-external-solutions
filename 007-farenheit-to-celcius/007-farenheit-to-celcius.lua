function split(splstr, splchr)
  splchr = splchr == nil and '%s' or splchr
  local result = {}
  local ind = 1
  for i in string.gmatch(splstr, "([^"..splchr.."]+)") do
    result[ind] = i
    ind = ind + 1
  end
  return result
end

function tonumberarr(array)
  for i = 1, #array do
    array[i] = tonumber(array[i])
  end
  return array
end

function round(a) 
  s, d = math.modf(a)
  locall = 0
  if s ~= math.abs(s) then
    return d < 0.5 and s or s - 1
  else
    return d < 0.5 and s or s + 1
  end
end

tables = split(io.read())
for i = 2, #tables do
  io.write(round(((tables[i] - 32) / 1.8)), ' ')
end