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
sel <- as.numeric(as.character(brgh$Pop_2001)) > 200000 #needs to be changed to character then numeric
plot(brgh[sel,], col="turquoise", add=TRUE)
sel <- as.numeric(as.character(brgh$Pop_2001)) > 250000
plot(brgh[sel,], col="pink", add=TRUE)

## Joining data from external sources

brgh_extra<-read.csv(file = "london-borough-profiles.csv", header = T, sep = ",", stringsAsFactors = F) #Check which names match
                     brgh$name %in% brgh_extra$Area.name
brgh$name %in% brgh_extra$Area.name
#Alternatively, find those that don't match
brgh$name[!brgh$name %in% brgh_extra$Area.name]

install.packages(dplyr)
library(dplyr)

#renames the column in the brgh data for the join
brgh_extra<-rename(brgh_extra, name=Area.name)

brgh_extra<-rename(brgh_extra, ESL=X..of.pupils.whose.first.language.is.not.English..2014.)

brgh@data <- left_join(brgh@data, brgh_extra)

##Mapping with tmap

install.packages(tmap)
library(tmap)

qtm(brgh, "ESL")


