ratio = Problem6_data[ ,1] / Problem6_data[ ,2]
rounder <- function(x) ifelse((x - 0.5) %% 2 == 0, round(x) + 1, round(x))
rounded_values <- sapply(ratio, rounder)
cat(rounded_values, sep = " ")