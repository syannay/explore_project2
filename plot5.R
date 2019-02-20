##How have emissions from motor vehicle sources changed
##from 1999–2008 in Baltimore City?

plot5 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  mrg <- merge(NEI, SCC, by="SCC")
  city <- subset(mrg, fips=="24510")
  mobile_based <- subset(city, grepl("^Mobile", EI.Sector))
  total <- with(mobile_based, tapply(Emissions, year, sum, na.rm=TRUE))
  plot(total)
}