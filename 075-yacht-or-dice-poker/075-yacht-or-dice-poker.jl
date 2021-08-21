data = split("3
3 6 5 6 1
1 6 6 1 6
2 4 3 5 1", "\n")

iterator = int(data[1])

for i in 2:iterator+1
  points = int(split(data[i], " "))
  
  p_set = Set(points)
  p_set_len = length(p_set)
  
  if p_set_len == 1
    @printf "yacht "
    
  elseif p_set_len == 2
    p_coll = collect(p_set)
    if length(findin(points, p_coll[1])) == 4 || length(findin(points, p_coll[2])) == 4
      @printf "four "
    else
      @printf "full-house "
    end
    
  elseif p_set_len == 3
    p_coll = collect(p_set)
    p1 = length(findin(points, p_coll[1]))
    p2 = length(findin(points, p_coll[2]))
    p3 = length(findin(points, p_coll[3]))
    if maximum([p1, p2, p3]) == 3  
      @printf "three "
    else
      @printf "two-pairs "
    end
    
  elseif p_set_len == 4
    @printf "pair "
    
  else
    if sort(points)[1] == 1
      @printf "small-straight "
    else
      @printf "big-straight "
    end
  end
  
end