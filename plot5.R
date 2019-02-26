##How have emissions from motor vehicle sources changed
##from 1999–2008 in Baltimore City?

plot5 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  mrg <- merge(NEI, SCC, by="SCC")
  city <- subset(mrg, fips=="24510")
  mobile_based <- subset(city, grepl("^Mobile", EI.Sector))
  total <- with(mobile_based, tapply(Emissions, year, sum, na.rm=TRUE))
  df <- data.frame(total)
  colnames(df) <- c("value")
  p1 <- ggplot(data=df, aes(x=rownames(df),y=value, fill=rownames(df)))+geom_bar(stat="identity")
  p2 <- p1+xlab("year")+guides(fill=guide_legend(title="year"))+ggtitle("Emissions from vehicle motor across US")
  options("scipen"=1000, "digits"=4)
  print(p2)
  dev.copy(png,'plot5.png')
  dev.off()
}