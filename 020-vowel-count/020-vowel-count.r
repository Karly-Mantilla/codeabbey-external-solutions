
vowels <- c("a", "o", "u", "i", "e", "y")
result <- c()
for (str_data in Problem20_data$V1)
{
    q <- unlist(strsplit(str_data, ""))
    l <- q[q %in% vowels]
    result <- append(result, length(l))
}

cat(result, sep = " ")