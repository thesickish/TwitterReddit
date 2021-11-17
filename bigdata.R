setwd("C:/Users/yotam/Documents/Capitol")

load("rconvo2.RData")

bigred <- com[c("URL","user","comm_date","structure","comment_score","comment")]

load("tconvo_user.RData")

bigtw1 <- user1[c("screen_name","created_at","reply_to_status_id","status_id","favorite_count","text")]
bigtw2 <- user2[c("screen_name","created_at","reply_to_status_id","status_id","favorite_count","text")]
bigtw <- rbind(bigtw1,bigtw2)

datamerge <- data[c("id","convo")]
names(datamerge) <- c("status_id","convo")

mer <- merge(x=datamerge,y=bigtw,by="status_id")

save.image("bigdata.RData")


