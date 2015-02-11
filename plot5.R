# This script creates plot 5

# Load & prepare the data
NEI <- readRDS("summarySCC_PM25.rds")
NEIsub <- subset(NEI, fips == '24510')
SCC <- readRDS("Source_Classification_Code.rds")

motor <- subset(SCC, grepl("Motor", Short.Name))
NEImotor <- subset(NEIsub, SCC %in% motor$SCC)

NEIagg4 <- aggregate(Emissions ~ year, NEImotor, sum)

# Open PNG device
png(filename='plots/plot5.png')

# Make plot
barplot(NEIagg4$Emissions, names = NEIagg4$year,
        main='Total PM2.5 emission from motor vehicles \n for Baltimore City (MD) by year',
        ylab='Emission PM2.5 (tons)')

# Turn off PNG device
dev.off()