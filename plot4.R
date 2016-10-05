#Class: Exploring Data Analysis
#Title: Week 1 Project
#File: plot4.R
#Date: 2016 OCT 05
#Author: Diana Garrett


data = read.table("household_power_consumption.txt", sep=";", 
                  header = TRUE, stringsAsFactors=FALSE)


# Convert Date from level to a Date class
library(lubridate)
dDate = dmy(data$Date)
data = cbind(dDate,data)



dataThuFri=subset(dataThuFriSat, dDate=="2007-02-01" | dDate=="2007-02-02")

Stamp =with(dataThuFri, paste(dDate,Time))
Stamp =strptime(Stamp, "%Y-%m-%d %H:%M:%S" ) 

png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(Stamp,as.numeric(dataThuFri$Global_active_power), type='l',
     xlab="",ylab ="Global Active Power",cex.axis=.85,cex.lab=.85)

plot(Stamp,as.numeric(dataThuFri$Voltage), type='l',
     xlab="datetime",ylab ="Voltage",cex.axis=.85,cex.lab=.85)

plot(Stamp,as.numeric(dataThuFri$Sub_metering_1), type='n',
     xlab="",ylab ="Energy sub metering",cex.axis=.85,cex.lab=.85)
points(Stamp,as.numeric(dataThuFri$Sub_metering_1), type='l')
points(Stamp,as.numeric(dataThuFri$Sub_metering_2), type='l', col='red')
points(Stamp,as.numeric(dataThuFri$Sub_metering_3), type='l', col='blue')
legend("topright", col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       lwd=1,cex=.75)

plot(Stamp,as.numeric(dataThuFri$Global_reactive_power), type='l',
     xlab="datetime",ylab="Global_reactive_power",cex.axis=.85,cex.lab=.85)

dev.off()
