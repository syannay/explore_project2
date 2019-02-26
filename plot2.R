##Have total emissions from PM2.5 decreased in the 
##Baltimore City, Maryland fips=="24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering
##this question.
plot2 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  ##SCC <- readRDS("Source_Classification_Code.rds")
  ##mrg <- merge(NEI, SCC, by="SCC")
  city <- subset(NEI, fips=="24510")
  total <- with(city, tapply(Emissions, year, sum, na.rm=TRUE))
  ylabs<-round(total/1000, 2)
  barplot(ylabs, col = c("red", "green", "blue", "yellow"), main="Total Emission of PM2.5 in Baltimore(in Killos)")
  dev.copy(png,'plot2.png')
  dev.off()
}