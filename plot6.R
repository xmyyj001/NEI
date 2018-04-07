projdir <- "~/../downloads/data science/exploratory track/NEI_data/"
setwd(projdir)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?

vehi_rela<-SCC[grepl("Vehicles",SCC$EI.Sector),]
NEI_vehi<-merge(NEI,vehi_rela,by.x = "SCC",by.y="SCC")
NEI_vehi_Bal_LA<-NEI_vehi[NEI_vehi$fips=="24510"|NEI_vehi$fips=="06037",]
emi_vehi_Bal_LA<-ddply(NEI_vehi_Bal_LA,c("fips","year"),summarise,sumEmi=sum(Emissions))
scal1<- subset(emi_vehi_Bal_LA,fips=="06037")$"sumEmi"
scal2<- subset(emi_vehi_Bal_LA,fips=="24510")$"sumEmi"
emi_vehi_Bal_LA<-transform(emi_vehi_Bal_LA,scal=rbind(scal1,scal2))
qplot(year,scal,data=emi_vehi_Bal_LA,col=fips,geom="line",ylab="scaled emission",main="motor vehicles emissions comparisson between LA and Baltirmore")