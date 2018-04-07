projdir <- "~/../downloads/data science/exploratory track/NEI_data/"
setwd(projdir)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Of the four types of sources indicated by the 
#type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases
# in emissions from 1999¨C2008 for Baltimore City? Which have seen increases in emissions from 1999¨C2008?
#  Use the ggplot2 plotting system to make a plot answer this question.

library(plyr)
emiBal<-subset(NEI,NEI$fips=="24510")
emiBal3<-ddply(emiBal,c("type","year"),summarise,sumtype=sum(Emissions))
qplot(year,sumtype,data=emiBal3,facets = .~type,geom="line",main = "types of emissions in Baltimore")
