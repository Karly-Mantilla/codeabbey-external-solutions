init_num <- Problem8_data$V1
step_size <- Problem8_data$V2
n <- Problem8_data$V3


result <- init_num*n + step_size * ((n * (n-1)) / 2)
cat(result, sep = " ")