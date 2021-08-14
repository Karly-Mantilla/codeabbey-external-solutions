library(dplyr)

side_1 <- Problem9_data$V1
side_2 <-Problem9_data$V2
side_3 <- Problem9_data$V3

ind_1 <- side_1 + side_2 > side_3
ind_2 <- side_2 + side_3 > side_1
ind_3 <- side_1 + side_3 > side_2

ind_tri <- ind_1 & ind_2 & ind_3

cat(as.numeric(ind_tri), sep = " ")

#an extra code, if we need to see the sides of the triangle 
my_df <- Problem9_data %>% filter(ind_tri == TRUE) 
