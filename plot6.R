##Compare emissions from motor vehicle sources in 
##Baltimore City with emissions from motor vehicle
##sources in Los Angeles County, California fips=="06037"). 
##Which city has seen greater changes over time 
##in motor vehicle emissions?

plot6 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  mrg <- merge(NEI, SCC, by="SCC")
  city1 <- subset(mrg, fips=="24510")
  city2 <- subset(mrg, fips=="06037")
  mobile_based1 <- subset(city1, grepl("^Mobile", EI.Sector))
  mobile_based2 <- subset(city2, grepl("^Mobile", EI.Sector))
  total1 <- with(mobile_based1, tapply(Emissions, year, sum, na.rm=TRUE))
  total2 <- with(mobile_based2, tapply(Emissions, year, sum, na.rm=TRUE))
  par(mfrow=c(1,2))
  barplot(total1, col=c("red", "green", "blue", "yellow"), main="Motor vehicle - Baltimore")
  barplot(total2, col=c("red", "green", "blue", "yellow"), main="Motor vehicle - Los Angeles")
  dev.copy(png,'plot6.png')
  dev.off()
}