library(dplyr)
library(peRspective)

setwd("C:/Users/yotam/Documents/Capitol")
load("final.RData")

cIDR <- as_tibble(cIDR)
cIDT <- as_tibble(cIDT)

redp <- as_tibble(redp)
twtp <- as_tibble(twtp)

names(cIDR) <- "ID"
names(cIDT) <- "ID"

redp$ID <- as.character(redp$ID)
twtp$ID <- as.character(twtp$ID)

codR <- inner_join(x=redp,y=cIDR,by="ID")
codT <- inner_join(x=twtp,y=cIDT,by="ID")

dcR <- dim(codR)[1]
dcT <- dim(codT)[1]

codedR <- NULL
codedT <- NULL

error <- "Error in prsp_score"

for(i in 1:dcR)
{	
	score <- try(prsp_score(
           as.character(codR[i,"comment"]), 
           score_sentences = F,
           score_model = peRspective::prsp_models))

	if(substr(score[1],1,19) != error)
	{
		score$ID <- as.character(codR[i,"ID"])
		codedR <- rbind(codedR,score)
	}

	Sys.sleep(1.1)
}

for(i in 1:dcT)
{	
	score <- try(prsp_score(
           as.character(codT[i,"text"]), 
           score_sentences = F,
           score_model = peRspective::prsp_models))

	if(substr(score[1],1,19) != error)
	{
		score$ID <- as.character(codT[i,"ID"])
		codedT <- rbind(codedT,score)
	}

	Sys.sleep(1.1)

}

save.image("coded.RData")

