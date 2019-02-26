##Of the four types of sources indicated by the 
##type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in
##emissions from 1999–2008 for Baltimore City?
##Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question
library(ggplot2)
plot3 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  ##SCC <- readRDS("Source_Classification_Code.rds")
  ##mrg <- merge(NEI, SCC, by="SCC")
  city <- subset(NEI, fips=="24510")
  total <- with(city, tapply(Emissions, list(year, type), sum, na.rm=TRUE))
  df <- as.data.frame(as.table(total))
  colnames(df) <- c("year", "type", "value")
  p1 <- ggplot(data=df, aes(x=year,y=value, fill=year))+geom_bar(stat="identity")
  p2 <- p1 + facet_grid(.~type) + ggtitle("Changes of (point, nonpoint, onroad, nonroad)") 
  print(p2)
  dev.copy(png,'plot3.png')
  dev.off()
}