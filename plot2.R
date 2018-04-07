projdir <- "~/../downloads/data science/exploratory track/NEI_data/"
setwd(projdir)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

emiBal<-subset(NEI,NEI$fips=="24510")
emi2<-cbind(emi2,emiBal=tapply(emiBal$Emissions,emiBal$year, sum))
with(emi2,plot(year,emiBal,pch=20,col="blue"))
with(emi2,lines(year,emiBal,col="blue"))
title("Baltimore total PM2.5 emission by year")
