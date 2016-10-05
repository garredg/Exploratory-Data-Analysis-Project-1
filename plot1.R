#Class: Exploring Data Analysis
#Title: Week 1 Project
#File: plot1.R
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

png(filename = "plot1.png")
hist(as.numeric(dataThuFri$Global_active_power), col="red", 
     main="Global Active Power", 
     xlab ="Global Active Power (kilowatts)")
dev.off()
