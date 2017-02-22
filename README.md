# README
This project collects a random sample of tweets from the 100 most populous counties in the United States using R and Twitter's streaming API. If you don't adjust the parameters, the program will try to stream up to 1,000 tweets from each location, with a timeout of 5 minutes per search. Read more about Twitter's streaming APIs at [this link](https://dev.twitter.com/streaming/overview).


## Details

### Authentication
the filterStream command takes an "oauth" argument in which you can pass an oauth object that contains your authorization credentials. The Github repo does not include my oauth file for privacy reasons -- you need to set this up yourself. To do this, you must first create and register an app (easy to do) at dev.twitter.com. Then use the credentials supplied by Twitter to get a consumer key and consumer secret. Run the following R code to create and save your own oauth object as class(oauth). Replace xxxxxxxxxxxx with your own consumer key and consumer secret.

```
library(ROAuth)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "xxxxxxxxxxxxxxxxxx"
consumerSecret <- "xxxxxxxxxxxxx"
my_oauth <- OAuthFactory$new(consumerKey=consumerKey,
                            consumerSecret=consumerSecret, requestURL=requestURL,
                            accessURL=accessURL, authURL=authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
save(my_oauth, file = "my_oauth.Rdata")
```

### Geolocation
The filterStream command takes a "location" argument in which you can specify a bounding box around a location in which you want to search. This argument takes the form of a longitude/latitude pairs with the southwest corner coming first. See help(filterStream). I obtained the coordinates for the bounding boxes from Github user stucka (https://github.com/stucka/us-county-bounding-boxes) in csv format. I then merged in county population data from the 2010 Census to sort out the 100 most populous counties.

It's possible to collect tweets that fall within the bounding box (a rectangle) but outside of the county boundaries (a complex polygon). I'm currently writing a program to identify fips codes exactly from each tweet based on lat/lon coordinates. I'll update this repo when that program is ready.
