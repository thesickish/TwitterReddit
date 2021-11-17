# install.packages("academictwitteR")
library(academictwitteR)
library(rtweet)
library(dplyr)
library(datetime)
library(stringr)

setwd("C:/Users/yotam/Documents/Capitol")

bearer_token <- "AAAAAAAAAAAAAAAAAAAAAL7GQQEAAAAANGHkKf7etYb1JzDEDF%2FDc3Me8Go%3D0wqacHBN83OUw6MDS3aq8ADY5vRV11lKZKX1SbN1RCa8mHmseG" 

beg <- as.POSIXlt("2021-01-06 15:00:00",origin="1970-01-01 00:00:00")

for(i in 1:1440)
{
	r = floor(runif(1)*6)
	begr = beg + 10*r
	endr = begr + 10
	
	begr = paste0(str_replace(as.character(begr)," ","T"),"Z")
	endr = paste0(str_replace(as.character(endr)," ","T"),"Z")

	invisible(capitol <-
  	get_all_tweets(
    	"Capitol",
    	is_retweet = FALSE,
    	is_reply = FALSE,
    	begr,
    	endr,
    	bearer_token,
    	lang = "en",
    	data_path = "C:/Users/yotam/Documents/Capitol/tweets/try3",
    	bind_tweets = FALSE
  ))
	
	Sys.sleep(4)
	beg = beg + 60
}

capitol <- bind_tweet_jsons(data_path = "C:/Users/yotam/Documents/Capitol/tweets/try3")

save.image("twitter2.RData")

