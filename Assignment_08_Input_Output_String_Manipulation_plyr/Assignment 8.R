# Michael Phommavong
# Assignment 8 Input/Output, String Manipulation, and plyr Package

# 1. Import Data
library(dplyr)

data <- read.csv("C:/Users/shick/OneDrive/Desktop/LIS4370 R PROGRAMMING/Mental_Health_and_Social_Media_Balance_Dataset.csv", stringsAsFactors = FALSE)

# 2. Compute Mean Happiness Index by Gender
gender_mean <- data %>%
  group_by(Gender) %>%
  summarise(Mean_Happiness = mean(Happiness_Index.1.10., na.rm = TRUE))

# Save to text file
write.table(gender_mean, 
            file = "gender_mean.txt", 
            sep = "\t", 
            row.names = FALSE, 
            quote = FALSE)

# 3. Filter rows where Social Media Platform contains "YouTube"
youtube_users <- subset(data, grepl("YouTube", Social_Media_Platform, ignore.case = TRUE))

# Export just User_IDs
write.csv(youtube_users$User_ID,
          file = "YouTube_users.csv",
          row.names = FALSE,
          quote = FALSE)

# 4. Export full filtered dataset
write.csv(youtube_users,
          file = "YouTube_users_full.csv",
          row.names = FALSE)