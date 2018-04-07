projdir <- "~/../downloads/data science/exploratory track/NEI_data/"
setwd(projdir)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.

emi2<-tapply(NEI$Emissions,NEI$year,sum)
emi2<-data.frame(emi2)
emi2[,2]<-c(1999,2002,2005,2008)
names(emi2)<-c("emissions","year")
with(emi2,plot(year,emissions,pch=20,col="red"))
with(emi2,lines(year,emissions,col="red"))
title("Total PM2.5 emission by year")