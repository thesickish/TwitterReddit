library(dplyr)

setwd("C:/Users/yotam/Documents/Capitol")
load("coded.RData")

fR <- rename(fR,ID_middle = merv)
fT <- rename(fT,ID_middle = merv)

nR <- names(codedR)
nT <- names(codedT)

names(codedR) <- paste0(nR,"_before")
finR <- merge(x=fR,y=codedR,by="ID_before")

names(codedR) <- paste0(nR,"_middle")
finR <- merge(x=finR,y=codedR,by="ID_middle")

names(codedR) <- paste0(nR,"_after")
finR <- merge(x=finR,y=codedR,by="ID_after")

names(codedT) <- paste0(nT,"_before")
finT <- merge(x=fT,y=codedT,by="ID_before")

names(codedT) <- paste0(nT,"_middle")
finT <- merge(x=finT,y=codedT,by="ID_middle")

names(codedT) <- paste0(nT,"_after")
finT <- merge(x=finT,y=codedT,by="ID_after")

write.csv(finR,"finR.csv")
write.csv(finT,"finT.csv")

save.image("finalcoded.RData")





