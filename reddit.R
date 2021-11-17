library(pushshiftR)
library(dplyr)

setwd("C:/Users/yotam/Documents/Capitol")

riot <- as.POSIXlt("2021-01-06 08:00:00",origin="1970-01-01 00:00:00")
riot <- as.character(as.numeric(riot))

riotp1 <- as.POSIXlt("2021-01-07 08:00:00",origin="1970-01-01 00:00:00")
riotp1 <- as.character(as.numeric(riotp1))

sub <- getPushshiftData(postType = "submission",
                 size = 100,
                 q = "Capitol",
                 after = riot,
                 before = riotp1,
                 nest_level = 1)

subs <- sub

while(dim(sub)[1] > 0)
{
	riot <- as.character(sub$created_utc[dim(sub)[1]])

	sub <- getPushshiftData(postType = "submission",
                 size = 100,
                 q = "Capitol",
                 after = riot,
                 before = riotp1,
                 nest_level = 1)

	subs <- bind_rows(subs,sub)
}

subs$date = as.POSIXlt(subs$created_utc, origin="1970-01-01 00:00:00")

save.image("reddit.RData")
