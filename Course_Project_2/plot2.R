## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot
library(dplyr)
data2<- NEI %>%
  filter(fips=="24510") %>%
  group_by(year=as.factor(year)) %>%
  summarise(Total.Emissions=sum(Emissions))
png(filename="plot2.png", width=480, height=480, units="px")
barplot(data2$Total.Emissions, names.arg=data2$year, col="orange", 
        main=expression(paste('Total emissions from PM', ''[2.5], ' in Baltimore City')), xlab="Year", 
        ylab=expression(paste('PM', ''[2.5], ', tons')))
dev.off()
