## Mapping Open Data using R ##

setwd("/Users/JonCollini/Desktop/Principles_Coding/Prac4")

## Loading and Subsetting data in R

#Reading in and checking data
library(rgdal)
brgh<-readOGR(dsn = ".", layer = "LondonBoroughs")
names(brgh)
head(brgh@data)

#Creating a result vector which holds boolean vecotrs
plot(brgh, col="lightgrey")
sel <- as.numeric(as.character(brgh$Pop_2001)) > 200000
#Has a factor value so this is done to convert to numeric
plot(brgh[sel,], col="turquoise", add=TRUE)
sel <- as.numeric(as.character(brgh$Pop_2001)) > 250000
plot(brgh[sel,], col="pink", add=TRUE)

## Joining data from external sources

brgh_extra<-read.csv("london-borough-profiles.csv", header = T, sep = ",", stringsAsFactors = F, check.names = T)
