projdir <- "~/../downloads/data science/exploratory track/NEI_data/"
setwd(projdir)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999¨C2008?
coal_rela<-SCC[grepl("Coal",x=(SCC$EI.Sector)),]
NEI_COAL<-merge(NEI,coal_rela,by.x = "SCC",by.y = "SCC")
library(plyr)
emi_coal<-ddply(NEI_COAL,c("type","year"),summarise,sumcoal=sum(Emissions))
qplot(year,sumcoal,data=emi_coal,facets = .~type,geom="line",ylab="coal related emissions",main = "coal emissions")
