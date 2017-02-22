
# load required libraries
if (!require("streamR")) install.packages("streamR")
library(streamR)

# load my saved oauth file
# see the README. Other users need to create this file for themselves. It's not included in the Github repo
load("my_oauth.Rdata")

# load bounding boxes
boxes.df = read.csv("bounding-boxes-100.csv", header=TRUE, sep=",")

# create lat/lon pairs 
boxes = paste(boxes.df$extentw, ",", boxes.df$extents, ",", boxes.df$extente, ",", boxes.df$extentn)

# stream tweets iteratively from each location on the list
for (i in boxes) {
  filterStream("tweets.json", locations = c((i)), tweets=1000, timeout = 300, 
               oauth = my_oauth, verbose = TRUE)
}

# convert to a data.frame
tweets.df = parseTweets("tweets.json", verbose = TRUE)























