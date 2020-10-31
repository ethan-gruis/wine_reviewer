# Author: Ethan Gruis, Shiv Patel, Ben Siglow
# ITAO 70310-02: Machine Learning

# Load in any libraries
library(tidyverse)
library(psych)
library(ggplot2)

# Load in dataset
wine = read_csv('./data/BordeauxWines.csv')

# Explore - summarize dataset
summary(wine)

describe(wine)

# Cleaning
wine[,5:989] <- lapply(wine[,5:989], factor)

str(wine[5:989])

wine$Price <- str_replace(wine$Price, "\\$", "")
wine$Price <- as.numeric(wine$Price)

# Visualization 
g_1 <- ggplot(data = wine, aes(x = Price, y = Score)) +
  geom_point(alpha = .5) +
  geom_smooth(method = 'lm', color = 'blue') + 
  theme_bw() + # Set theme bw
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank())
g_1

g_2 <- ggplot(data = wine, aes(x = Year, y = Score)) +
  geom_point(alpha = .5) +
  geom_smooth(method = 'lm', color = 'blue') + 
  theme_bw() + # Set theme bw
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank())
g_2


# Training + Testing
# use xg boost
# run in parallel


