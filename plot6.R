# This script creates plot 6
if (!require("ggplot2")) {
        install.packages("ggplot2")
        library(ggplot2)
} 
if (!require("car")) {
        install.packages("car")
        library(car)
} 
# Load & prepare the data
NEI <- readRDS("summarySCC_PM25.rds")
NEIsub2 <- subset(NEI, fips %in% c('24510', '06037'))
SCC <- readRDS("Source_Classification_Code.rds")

motor <- subset(SCC, grepl("Motor", Short.Name))
NEImotor2 <- subset(NEIsub2, SCC %in% motor$SCC)


NEIagg5 <- aggregate(NEImotor2$Emissions, list(year = NEImotor2$year, county = NEImotor2$fips), sum)
NEIagg5$county <- recode(NEIagg5$county,"'24510'='Los Angeles County';'06037'='Baltimore City'")

# Open PNG device
png(filename='plots/plot6.png')

# Make plot
ggplot(NEIagg5, aes(x=year, y=x, fill = county)) +
        geom_bar(stat="identity") + 
        guides(fill=FALSE) +
        theme_bw() +
        facet_grid(county ~ .) +
        labs(list(title = 'Total PM2.5 emission from motor vehicles \n for Baltimore City (MD) & Los Angeles County (CA) by year', 
                  y = "Emission PM2.5 (tons)"
                  , x = " "))

# Turn off PNG device
dev.off()