# This script creates plot 2

# Load & prepare the data
NEI <- readRDS("summarySCC_PM25.rds")
NEIsub <- subset(NEI, fips == '24510')
NEIagg <- aggregate(Emissions ~ year, NEIsub, sum)

# Open PNG device
png(filename='plots/plot2.png')

# Make plot
barplot(NEIagg$Emissions, names = NEIagg$year,
        main='Total PM2.5 emission for Baltimore City (MD) by year',
        ylab='Emission PM2.5 (tons)',
        col=brewer.pal(4,"BuGn"))

# Turn off PNG device
dev.off()