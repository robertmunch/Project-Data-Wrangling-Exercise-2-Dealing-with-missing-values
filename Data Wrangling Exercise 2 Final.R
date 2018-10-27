library(readr)
library(dplyr)
library(tidyr)

titanic = read.csv('titanic_original.csv')

#Changes blanks to S
titanic_clean <- titanic %>%
  mutate(embarked = ifelse(embarked == "S", paste("S"), 
                    ifelse(embarked == "Q", paste("Q"), 
                    ifelse(embarked == "C", paste("C"), 
                    ifelse(embarked == "", paste("S"), NA))))) %>% 

#turns NAs in age coulumn into the mean age.
  mutate(age = ifelse(is.na(titanic$age), mean(x = titanic$age, na.rm = TRUE), titanic$age)) %>% 

#Places NA in blank spaces of boat column
  mutate(boat = ifelse(boat == "", NA, boat)) %>% 

#adds a column giving a binary if there is an available cabin number
  mutate(has_cabin_number = ifelse(cabin != "", 1, 0))

write.csv(titanic_clean,"titanic_clean.csv")
  
