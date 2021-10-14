options(digits = 12)
linear_reg <- lm(Price~Days, data = Problem95_data)
summary(linear_reg)
