# This script creates plot 3
if (!require("ggplot2")) {
        install.packages("ggplot2")
        library(ggplot2)
} 
# Load & prepare the data
NEI <- readRDS("summarySCC_PM25.rds")
NEIsub <- subset(NEI, fips == '24510')
NEIagg2 <- aggregate(NEIsub$Emissions, list(year = NEIsub$year, type = NEIsub$type), sum)

# Open PNG device
png(filename='plots/plot3.png')

# Make plot
ggplot(NEIagg2, aes(x=year, y=x, group = type, color = type)) +
        geom_line(size = 3) +
        theme(legend.position = c(.85,.85)) +
        theme_bw() +
        labs(list(title = 'Total PM2.5 emission for Baltimore City (MD). Per type, by year.', y = "Emission PM2.5 (tons)", x = " ")) 

# Turn off PNG device
dev.off()