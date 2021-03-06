# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
vector_1 <- c("Employee")
vector_2 <- 1:100
employee <- c(paste(vector_1, vector_2))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries17 <- c(round(runif(100, min = 40000, max = 50000), 2))

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salary_adjustments <- c(round(runif(100, min = -5000, max = 10000), 2))

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employee, salaries17, salary_adjustments, stringAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salaries18 <- (salaries17 + salary_adjustments)

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise <- (salary_adjustments > 0)


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
salaries[87, 5]
#$48312.10

# How many employees got a raise?
length(salaries[salaries == TRUE])
#69 employees

# What was the dollar value of the highest raise?
max(salaries[3])
#$9924.65

# What was the "name" of the employee who received the highest raise?
salaries[salaries[3] == 9924.65, 1]
#Employee 38

# What was the largest decrease in salaries between the two years?
min(salaries[3])
#-$4724.44

# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries[3] == -4724.44, 1]
#Employee 49

# What was the average salary change?
round(mean(salaries[[3]]),2)
#$2357.20

# For people who did not get a raise, how much money did they lose on average?
round(mean(salaries[salaries[6] == FALSE, 3]),2)
#-$2587.07

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "2017-2018 Salary Adjustments", row.names = FALSE)
