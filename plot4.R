##Across the United States, how have emissions from 
##coal combustion-related sources changed from 1999–2008?

plot4 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  mrg <- merge(NEI, SCC, by="SCC")
  coal_based <- subset(mrg, grepl("Coal", EI.Sector))
  total <- with(coal_based, tapply(Emissions, year, sum, na.rm=TRUE))
  plot(total)
}