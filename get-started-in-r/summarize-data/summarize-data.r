# Your turn!
# call the "tidyverse" library using the library() function
library(tidyverse)
# read our data file into R and assign it to a variable called "chocolateData".
# Remember that you can find out where the data is by expanding the "Input Files"
# box above by clicking the + sign in the left corner.
chocolateData <- read_csv("../../data/input/flavors_of_cacao.csv")
# remove the first row of the chocolateData data_frame using a negative index
chocolateData <- chocolateData[-1, ]
# check the first few rows of your data using the head() function to make sure it
# looks alright
head(chocolateData)

# Before we get going, let's get rid of the white spaces in the column names of this
# dataset. This will make it possible for us to refer to columns by thier names, since
# any white space in a name will mess R up.
names(chocolateData) <- gsub("[[:space:]+]", "_", names(chocolateData))
str(chocolateData)

# Your turn!
# Use the str() function to check the data type of the columns in chocolateData
str(chocolateData)

head(chocolateData$Rating)

# automatically convert the data types of our data_frame
chocolateData <- type_convert(chocolateData)

# Your turn!
# Check out the structure of the converted data using the str() function
str(chocolateData)

# remove all the percent signs in the fifth column. You don't really need to worry about
# all the different things that are happening in this line right now.
chocolateData$Cocoa_Percent <- sapply(chocolateData$Cocoa_Percent, function(x) gsub("%", "", x))
# try the type_convert() function again
chocolateData <- type_convert(chocolateData)
# check the structure to make sure it actually is a percent
str(chocolateData)

?summary
?summarise_all
# summary function from base R (base R means no packages)
summary(chocolateData)
summarise_all(chocolateData, list(mean = mean))

# Your turn!
# Use the summarise_all() function to find the standard deviation of each numeric column.
summarise_all(chocolateData, list(sd = sd))

# return a data_frame with the mean and sd of the Rating column, from the chocolate dataset in it
chocolateData %>% summarize(averageRating = mean(Rating), sdRating = sd(Rating))

# Return the average and sd of ratings by the year a rating was given
chocolateData %>%
  group_by(Review_Date) %>%
  summarise(averageRating = mean(Rating), sdRating = sd(Rating))
