# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
install.packages("nycflights13")
install.packages("dplyr")
library(nycflights13)
library(dplyr)



# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
flight <- flights
# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
arrdeptale <- mutate(flights, arrdep = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
desccol <- arrange(arrdeptale, -arrdep)

# Try doing the last 2 steps in a single operation using the pipe operator
ardepdescol <- mutate(flights, arrdep = arr_delay - dep_delay) %>%
  arrange(-arrdep)

# Make a histogram of the amount of gain using the `hist` command
hist(arrdeptale$arrdep)

# On average, did flights gain or lose time?
mean(arrdeptale$arrdep, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
seaarr <- filter(arrdeptale, dest == "SEA")

# On average, did flights to seatac gain or loose time?
mean(seaarr$arrdep, na.rm = TRUE)
### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation
funct <- function(orig, destination, column){
  dat <- filter(arrdeptale, origin == orig, dest == destination) %>% select_(column)
  return(dat)
  
}

# Retireve the air_time column for flights from JFK to SEA
airjfksea <- funct("JFK", "SEA", "air_time")

# What was the average air time of those flights (in hours)?  
meanair <- mean(airjfksea$air_time, na.rm = TRUE) / 60

# What was the min/max average air time for the JFK to SEA flights?
minair <- min(airjfksea$air_time, na.rm = TRUE) / 60
maxair <- max(airjfksea$air_time, na.rm = TRUE) / 60
