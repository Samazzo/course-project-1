library(viridis)
library(ggplot2)
library(readr)
library(tidyr)
library(plyr)
library(dplyr)
library(gridExtra)
library(xlsx)
library(data.table)

# read dataset
power <- read.table("C:/Users/auke.beeksma/Documents/household_power_consumption.txt", header = TRUE, sep = ";", 
                    na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


powers <- filter(power, Date == "1/2/2007" | Date == "2/2/2007")

#plot 1
png(filename = "plot1.png", height = 480, width = 480)
hist(powers$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
