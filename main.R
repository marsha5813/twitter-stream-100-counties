
# load required libraries
if (!require("streamR")) install.packages("streamR")
library(streamR)

# load my saved oauth file
# see the README. Other users need to create this file for themselves. It's not included in the Github repo
load("my_oauth.Rdata")

# load coordinates for bounding boxes
boxes.df = read.csv("coords.csv", header=FALSE, sep=",", stringsAsFactors = FALSE)
locations = as.numeric(as.matrix(boxes.df["V1"]))

# Splits the location data into four lists
# For some reason, filterStream won't allow me to input all 100 locations at once
locations1 = locations[1:100]
locations2 = locations[101:200]
locations3 = locations[201:300]
locations4 = locations[301:400]

# stream tweets from the first 100 locations on the list
filterStream("tweets.json", locations = locations1, tweets=1000, timeout = 300, 
             oauth = my_oauth, verbose = TRUE)

# stream tweets from the second 100 locations on the list
filterStream("tweets.json", locations = locations2, tweets=1000, timeout = 300, 
             oauth = my_oauth, verbose = TRUE)

# stream tweets from the third 100 locations on the list
filterStream("tweets.json", locations = locations3, tweets=1000, timeout = 300, 
             oauth = my_oauth, verbose = TRUE)

# stream tweets from the fourth 100 locations on the list
filterStream("tweets.json", locations = locations4, tweets=1000, timeout = 300, 
             oauth = my_oauth, verbose = TRUE)

# convert to a data.frame
tweets.df = parseTweets("tweets.json", verbose = TRUE)























