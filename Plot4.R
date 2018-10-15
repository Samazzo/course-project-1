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



#plot4
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powers, {
  plot(Global_active_power~date, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~date, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~date, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~date,col='Red')
  lines(Sub_metering_3~date,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~date, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
  dev.off()
})