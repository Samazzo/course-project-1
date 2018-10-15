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

#plot 2
powers$Date <- as.Date(powers$Date, "%d/%m/%Y")
powers <- powers[complete.cases(powers),]
date <- paste(powers$Date, powers$Time)
date <- setNames(date, "date")
powers <- cbind(date, powers)
powers$date <- as.POSIXct(date)

png(filename = "plot2.png", height = 480, width = 480)
plot(powers$Global_active_power~powers$date,type="l", ylab="lobal Active Power (kilowatts)", xlab="")
dev.off()