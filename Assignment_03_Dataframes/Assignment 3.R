# Load library
library(ggplot2)

# 1. Define and Inspect Data
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4, 62, 51, 21,  2,  14, 15)
CBS_poll   <- c( 12, 75, 43, 19,  1,  21, 19)

# Create dataframe
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect the dataframe
str(df_polls)
head(df_polls)

# 2. Compute Summary Statistics

# Compute mean, median, and and range for each poll

# ABC_poll
mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls[, c("ABC_poll")])

# CBS_poll
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("CBS_poll")])

# Add a new column for the difference between CBS and ABC
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_pol

# Create bar chart using ggplot2
ggplot(df_polls, aes(x = Name, y = Diff, fill = Diff > 0)) +
  geom_col() +
  scale_fill_manual(values = c("purple", "orange"),
                    labels = c("CBS < ABC", "CBS > ABC")) +
  labs(title = "Difference in Poll Results (CBS - ABC)",
       x = "Candidate",
       y = "Difference in Polls") +
  theme_minimal()