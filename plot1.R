# This script creates plot 1
if (!require("RColorBrewer")) {
        install.packages("RColorBrewer")
        library(RColorBrewer)
} 

# Load & prepare the data
NEI <- readRDS("summarySCC_PM25.rds")
NEIagg <- aggregate(Emissions ~ year, NEI, sum)

# Open PNG device
png(filename='plots/plot1.png')

# Make plot
barplot(NEIagg$Emissions/10^6, 
        names = NEIagg$year,
        main='Total PM2.5 emission for the United States by year',
        ylab='Emission PM2.5 (10^6 tons)',
        col=brewer.pal(4,"Blues"))

# Turn off PNG device
dev.off()