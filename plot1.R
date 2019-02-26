##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from 
##all sources for each of the years 1999, 2002, 2005, and 2008.
plot1 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  ##SCC <- readRDS("Source_Classification_Code.rds")
  ##mrg <- merge(NEI, SCC, by="SCC")
  total <- with(NEI, tapply(Emissions, year, sum, na.rm=TRUE))
  ylabs<-round(total/1000000, 2)
  barplot(ylabs, col = c("red", "green", "blue", "yellow"), main="Total Emission of PM2.5 (in Millions)")
  dev.copy(png,'plot1.png')
  dev.off()
}