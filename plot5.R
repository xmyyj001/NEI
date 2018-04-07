projdir <- "~/../downloads/data science/exploratory track/NEI_data/"
setwd(projdir)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed from 1999¨C2008 in Baltimore City?
vehi_rela<-SCC[grepl("Vehicles",SCC$EI.Sector),]
NEI_vehi<-merge(NEI,vehi_rela,by.x = "SCC",by.y="SCC")
Bal_vehi<-subset(NEI_vehi,NEI_vehi$fips=="24510")
Bal_vehi_emi<-data.frame(tapply(Bal_vehi$Emissions,Bal_vehi$year,sum))
names(Bal_vehi_emi)<-"Emissions"
Bal_vehi_emi<-transform(Bal_vehi_emi,year=c(1999,2002,2005,2008))
with(Bal_vehi_emi,plot(year,Emissions,pch=20,col="blue"))
with(Bal_vehi_emi,lines(year,Emissions,col="blue"))
title("Motor Vehicles Emissions in  Baltimore")
