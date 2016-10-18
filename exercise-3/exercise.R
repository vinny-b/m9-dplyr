# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1
install.packages("dplyr")

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acura.hw.2015.vehicle <- filter(vehicles, year == 2015)
acura.hw.2015.make <- filter(acura.hw.2015.vehicle, make == "Acura")
acura.hw.2015.hwy <- filter(acura.hw.2015.make, hwy == max(hwy))
acura.hw.2015.name <-  select(acura.hw.2015.hwy, model)
# Which Accura model has the best hwy MPG in 2015? (nesting functions)
acura.hw.2015.name.2 <-  select(filter(filter(filter(vehicles, year == 2015), make == "Acura"), hwy == max(hwy)), model)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
accura.hw.2015.name.3 <- filter(vehicles, year == 2015) %>%
  filter(make == "Acura") %>%
  filter(hwy == max(hwy))%>%
  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
