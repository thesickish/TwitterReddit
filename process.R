setwd("C:/Users/yotam/Documents/Capitol")
# devtools::install_github("https://github.com/nathancunn/pushshiftR")

library(academictwitteR)
library(rtweet)
library(dplyr)
library(datetime)
library(stringr)
library(pushshiftR)

load("reddit.RData")
load("twitter2.RData")

# capitol <- bind_tweet_jsons(data_path = "C:/Users/yotam/Documents/Capitol/saveforever")
# dim(capitol)[1] = 225616

# capitol <- bind_tweet_jsons(data_path = "C:/Users/yotam/Documents/Capitol/tweets/try2")
# dim(capitol)[1] = 225616

dim(subs)
dim(capitol)
sum(subs$num_comments)
sum(capitol$public_metrics$reply_count)

rm(list = ls())

load("rconvo2.RData")
load("tconvo.RData")




