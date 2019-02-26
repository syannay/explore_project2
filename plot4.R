##Across the United States, how have emissions from 
##coal combustion-related sources changed from 1999–2008?

plot4 <- function() {
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  mrg <- merge(NEI, SCC, by="SCC")
  coal_based <- subset(mrg, grepl("Coal", EI.Sector))
  total <- with(coal_based, tapply(Emissions, year, sum, na.rm=TRUE))
  df <- data.frame(total)
  colnames(df) <- c("value")
  p1 <- ggplot(data=df, aes(x=rownames(df),y=value, fill=rownames(df)))+geom_bar(stat="identity")
  p2 <- p1+xlab("year")+guides(fill=guide_legend(title="year"))+ggtitle("Emissions from coal across US")
  options("scipen"=1000, "digits"=4)
  print(p2)
  dev.copy(png,'plot4.png')
  dev.off()
}