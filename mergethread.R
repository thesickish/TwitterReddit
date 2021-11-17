library(dplyr)

setwd("C:/Users/yotam/Documents/Capitol")
load("threading.RData")

XRt <- as_tibble(XR)
XTt <- as_tibble(XT)

XRt2 <- XRt
XTt2 <- XTt

XRt <- rename(XRt,merv = ID_after)
XRt2 <- rename(XRt2,merv = ID_before)

XTt <- rename(XTt,merv = ID_after)
XTt2 <- rename(XTt2,merv = ID_before)

merR <- inner_join(XRt,XRt2,by="merv",suffix=c(".t",".t2"))
merT <- inner_join(XTt,XTt2,by="merv",suffix=c(".t",".t2"))

fR <- subset(merR,name_before.t == name_after.t2)
fT <- subset(merT,name_before.t == name_after.t2)

fR <- subset(fR,name_before.t != "[deleted]")
fR <- subset(fR,name_after.t != "[deleted]")
fR <- subset(fR,name_before.t2 != "[deleted]")
fR <- subset(fR,name_after.t2 != "[deleted]")

cIDR <- unique(rbind(t(t(unique(fR$ID_before))),t(t(unique(fR$merv))),t(t(unique(fR$ID_after)))))
cIDT <- unique(rbind(t(t(unique(fT$ID_before))),t(t(unique(fT$merv))),t(t(unique(fT$ID_after)))))

save.image("final.RData")







