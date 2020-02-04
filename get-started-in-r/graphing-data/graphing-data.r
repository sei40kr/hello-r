# Your turn!
# tell R that we're going to use the tidyverse library
library(tidyverse)
# read in our dataset as a data_frame and save it as a variable named "chocolateData"
chocolateData <- read_csv("../../data/input/flavors_of_cacao.csv")
# remove the first line of our dataset using a negative index
# remove the white spaces in the column names
names(chocolateData) <- gsub("[[:space:]+]", "_", names(chocolateData))
# remove percentage signs in the Cocoa_Percent
chocolateData$Cocoa_Percent <- sapply(chocolateData$Cocoa_Percent, function(x) gsub("%", "", x))
# automatically try to guess the data type of each column using type_convert
chocolateData <- type_convert(chocolateData)
# check the first few lines of our data_frame to make sure everything looks alright.
head(chocolateData)

# draw a blank plot with "Review_Date" as the x axis and "Rating" as the y axis.
ggplot(chocolateData, aes(x = Review_Date, y = Rating))

# draw a plot with "Review_Date" as the x axis and "Rating" as the y axis, and add a point for each data point
ggplot(chocolateData, aes(x = Review_Date, y = Rating)) + geom_point()

# draw a plot with "Review_Date" as the x axis and "Rating" as the y axis, add a point for each data point & move each point slightly so they don't overlap
ggplot(chocolateData, aes(x = Review_Date, y = Rating)) + geom_point() + geom_jitter()

# draw a plot with "Review_Date" as the x axis and "Rating" as the y axis, add a point for each data point, move each point slightly so they don't overlap and add a smoothed line (lm = linear model)
ggplot(chocolateData, aes(x = Review_Date, y = Rating)) + geom_point() + geom_jitter() + geom_smooth(method = "lm")

# draw a plot with "Review_Date" as the x axis and "Rating" as the y axis, add a point for each data point, move each point slightly so they don't overlap and add a smoothed line (lm = linear model). Encode Cocoa_Percent as color.
ggplot(chocolateData, aes(x = Review_Date, y = Rating, color = Cocoa_Percent)) + geom_point() + geom_jitter() + geom_smooth(method = "lm")

# Your turn!
# Plot the relationship between cocoa percentage and ratings, using whichever geom (or multiple geoms) you like.
ggplot(chocolateData, aes(x = Cocoa_Percent, y = Rating)) + geom_point(position = "jitter") + geom_smooth(method = "lm")
ggplot(chocolateData, aes(x = Cocoa_Percent, y = Rating)) + geom_point() + geom_smooth(method = "lm")
# Note that, if you use geom_smooth(), a linear model may not be the best fit for the data!

# save our plot to a variable with an informative name
chocolateRatingByReviewDate <- ggplot(chocolateData, aes(x = Review_Date, y = Rating, color = Cocoa_Percent)) + geom_point() + geom_jitter() + geom_smooth(method = "lm")
# save our plot
ggsave("../../data/output/chocolateRatingByReviewDate.png", # the name of the file where it will be save
  plot = chocolateRatingByReviewDate, # what plot to save
  height = 6, width = 10, units = "in"
) # the size of the plot & units of the size

# Your turn!
# Save the plot you made showing the relationship between cocoa percentage and to this kernel's output.
chocolate_rating_by_cacao_percent <- ggplot(chocolateData, aes(x = Cocoa_Percent, y = Rating)) + geom_point(position = "jitter") + geom_smooth(method = "lm")
ggsave("../../data/output/chocolate_rating_by_cacao_percent.png", plot = chocolate_rating_by_cacao_percent, height = 6, width = 10, units = "in")

# Return the average and sd of ratings by the year a rating was given
chocolateData %>%
  group_by(Review_Date) %>%
  summarise(averageRating = mean(Rating), sdRating = sd(Rating))

# Return the average and sd of ratings by the year a rating was given
averageRatingByYear <- chocolateData %>%
  group_by(Review_Date) %>%
  summarise(averageRating = mean(Rating))
# plot only the average rating by year
ggplot(averageRatingByYear, aes(y = averageRating, x = Review_Date)) + geom_point() + geom_line()
