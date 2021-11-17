library(rtweet)
tok <- create_token(app = "","","",access_token = "", access_secret = "", set_renv = TRUE)

setwd("C:/Users/yotam/Documents/Primaries/New")
notret <- read.csv("inf_did_not_merge.csv", header=TRUE)

rate_limit(token = tok, query = "statuses/lookup", parse = TRUE)

users <- lookup_statuses(notret$inf, parse = TRUE, token = tok)

save.image("inf_did_not_merge.RData")
