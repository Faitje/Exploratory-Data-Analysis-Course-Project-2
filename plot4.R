# This script creates plot 4

# Load & prepare the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- subset(SCC, grepl("Fuel Comb.*Coal", EI.Sector))
NEIcoal <- subset(NEI, SCC %in% coal$SCC)

NEIagg3 <- aggregate(Emissions ~ year, NEIcoal, sum)

# Open PNG device
png(filename='plots/plot4.png')

# Make plot
barplot(NEIagg3$Emissions/10^5, names = NEIagg3$year,
        main='Total PM2.5 emission from coal combustion-related sources \n for the United States by year',
        ylab='Emission PM2.5 (10^5 tons)')

# Turn off PNG device
dev.off()