library(rtweet)
tok <- create_token(app = "CapitolThreading","WYhADskBNIFJ9rtyPJ16cuHLR","QwVY0NlBCkmaRp2ZiDvjVrr4WdTDmx9XLDx4KfFhm7m3Cghr4J",access_token = "799294735965790208-OkkdgLU2qEy8xNqlidUz9AVqWJVI6GW", access_secret = "1rV1yoTA0vyvITv7TJriuJKt4wVG2tCXZUs6b8i287IYq", set_renv = TRUE)

setwd("C:/Users/yotam/Documents/Primaries/New")
notret <- read.csv("inf_did_not_merge.csv", header=TRUE)

rate_limit(token = tok, query = "statuses/lookup", parse = TRUE)

users <- lookup_statuses(notret$inf, parse = TRUE, token = tok)

save.image("inf_did_not_merge.RData")
