mean_values <- c()
numeric_conversion <- function (x) as.numeric(x) 
rounder <- function(x) ifelse((x - 0.5) %% 2 == 0, round(x) + 1, round(x))
for (i in 1:nrow(Problem16_data))
{
    data <- strsplit(Problem16_data[i, ], " ")
    m <- sapply(data, numeric_conversion)
    mean_v <- mean(m[-length(m)])
    mean_values <- append(mean_values, sapply(mean_v, rounder))
}

cat(mean_values, sep = " ")