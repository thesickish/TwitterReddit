library(dplyr)

setwd("C:/Users/yotam/Documents/Capitol")
load("bigdata.RData")

bigred$ID <- seq_along(bigred[,1])
mer$ID <- seq_along(mer[,1])

redp <- bigred[c("ID","URL","user","comm_date","structure","comment_score","comment")]
twtp <- mer[c("ID","status_id","convo","screen_name","created_at","reply_to_status_id","favorite_count","text")]

rm(list=setdiff(ls(), c("redp","twtp")))

uR <- unique(redp$URL)
uT <- unique(twtp$convo)

dR <- length(uR)
dT <- length(uT)

XR = NULL
XT = NULL

for(i in 1:dR)
{
	temp <- subset(redp,URL == uR[i])
	tempD <- dim(temp)[1]

	for(j in 1:(tempD-1))
	{
		for(k in (j+1):tempD)
		{
			tesk = paste0(temp$structure[j],"_")
			tesj = paste0(temp$structure[k],"_")

			if(tesk == substr(temp$structure[k],1,nchar(temp$structure[k])-1))
			{
				new = cbind(uR[i],temp$ID[j],temp$user[j],temp$comment_score[j],temp$structure[j],temp$ID[k],temp$user[k],temp$comment_score[k],temp$structure[k])
				XR <- rbind(XR,new)
			}

			if(tesj == substr(temp$structure[j],1,nchar(temp$structure[j])-1))
			{
				new = cbind(uR[i],temp$ID[k],temp$user[k],temp$comment_score[k],temp$structure[k],temp$ID[j],temp$user[j],temp$comment_score[j],temp$structure[j])
				XR <- rbind(XR,new)
			}
		}
	}
}

for(i in 1:dT)
{
	temp <- subset(twtp,convo == uT[i])
	tempD <- dim(temp)[1]

	for(j in 1:(tempD-1))
	{
		for(k in (j+1):tempD)
		{
			
			if(!is.na(temp$reply_to_status_id[k]))
			{
				if(temp$status_id[j] == temp$reply_to_status_id[k])
				{
					new = cbind(uT[i],temp$ID[j],temp$screen_name[j],temp$favorite_count[j],temp$status_id[j],temp$ID[k],temp$screen_name[k],temp$favorite_count[k],temp$status_id[k])
					XT <- rbind(XT,new)
				}
			}

			if(!is.na(temp$reply_to_status_id[j]))
			{
				if(temp$status_id[k] == temp$reply_to_status_id[j])
				{
					new = cbind(uT[i],temp$ID[k],temp$screen_name[k],temp$favorite_count[k],temp$status_id[k],temp$ID[j],temp$screen_name[j],temp$favorite_count[j],temp$status_id[j])
					XT <- rbind(XT,new)
				}
			}
		}
	}
}

XR <- as.data.frame(XR)
XT <- as.data.frame(XT)

names(XR) <- c("conv","ID_before","name_before","likes_before","status_before","ID_after","name_after","likes_after","status_after")
names(XT) <- c("conv","ID_before","name_before","likes_before","status_before","ID_after","name_after","likes_after","status_after")

save.image("threading.RData")



