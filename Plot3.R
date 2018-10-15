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

#plot3

png(filename = "plot3.png", height = 480, width = 480)
with(powers, {
  plot(powers$Sub_metering_1 ~ date,
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_1 ~ date, col = "black")
  lines(Sub_metering_2 ~ date, col = "red")
  lines(Sub_metering_3 ~ date, col = "Blue")
  
})

legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()