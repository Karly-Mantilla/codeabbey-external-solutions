#taking data from eacah array
R1 <- as.numeric(Problem51_data[1, ])
test_values1 <- c(mean(R1), median(R1), min(R1), max(R1))

R2 <- as.numeric(Problem51_data[2, ])
test_values2 <- c(mean(R2), median(R2), min(R2), max(R2))

R3 <- as.numeric(Problem51_data[3, ])
test_values3 <- c(mean(R3), median(R3), min(R3), max(R3))
print(test_values1)
print(test_values2)
print(test_values3)
#calculates the sum of dice for given number and side
dice_progrramer <- function(num_of_dice, num_of_side, N)
{
  dice_total <- c()
  for (i in 1:N)
  {
    dice <- c() #single throw of dice
    for (j in 1:num_of_dice)
    {
      dice <- c(dice, sample(1:num_of_side, 1))
    }
    dice_total <- c(dice_total, sum(dice)) #adding the sum of dices to the dice_total array
  }
  return(dice_total)
}


for (dice_num in 1:5)
{
  for (dice_side in seq(2,12,2))
  {
    V <- dice_progrramer(dice_num, dice_side, 10^4)
    data <- c(mean(V), median(V), min(V), max(V))
    if (abs(data[1] - test_values1[1]) < 0.3 & abs(data[2] - test_values1[2]) < 2 &
      data[3] - test_values1[3] < 2 & data[4] - test_values1[4] < 2)
    {
      cat(dice_num,"d", dice_side, "dice data 1 \n")
    }
    if (abs(data[1] - test_values2[1]) < 0.3 & abs(data[2] - test_values2[2]) < 2 &
        data[3] - test_values2[3] < 2 & data[4] - test_values2[4] < 2)
    {
      cat(dice_num,"d", dice_side,"dice data 2 \n")
    }
    if (abs(data[1] - test_values3[1]) < 0.3 & abs(data[2] - test_values3[2]) < 2 &
        data[3] - test_values3[3] < 2 & data[4] - test_values3[4] < 2)
    {
      cat(dice_num,"d", dice_side, "dice data 3 \n")
    }
  }
}
