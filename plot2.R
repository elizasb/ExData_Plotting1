## File: plot2.R
## Created: 2015-01-08
## Author: E.S.B.
## Association: Coursera Exploratory Data Analysis Class - 
## -- https://class.coursera.org/exdata-010/
## -- Assignment 1: https://class.coursera.org/exdata-010/
## human_grading/view/courses/973504/assessments/3/submissions
## Purpose - Read household power consumption data from UCI Machine Learning Repository, 
## subset the data to Feb. 1 & 2 2007, convert date & time into a timestamp (paste
## these two variables together and then use strptime to convert into a datetime) and
## create plots and save these as pngs.


## Read data and pre-process
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
Datetime<-paste(data$Date,data$Time)
data$timestamp<-strptime(Datetime,format="%d/%m/%Y %H:%M:%S")

# Plot 2 - Time Series of Global Active Power
png("plot2.png",width = 480, height = 480, units = "px") 
plot(data$timestamp,data$Global_active_power,type="n",xlab="",
     ylab='Global Active Power (kilowatts)')
lines(data$timestamp,data$Global_active_power,type="l")
dev.off ();