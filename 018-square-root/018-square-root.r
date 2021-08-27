options(digits = 8)

herons_sqrt <- function(num, N)
{
  r <- 1
  for (i in 1:N)
  {
    d <- num / r
    r <- mean(c(r, d))
  }
  return(r)
}

print(herons_sqrt(10, 4))

result <- c()
for (i in 1:nrow(Problem18_data))
{
  m <- herons_sqrt(Problem18_data[i, 1], Problem18_data[i, 2])
  result <- append(result, m)
}

cat(result, sep = " ")