## File: plot3.R
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

# Plot 3 - Time series of energy sub metering (line overlay)
png("plot3.png",width = 480, height = 480, units = "px") 
plot(data$timestamp,data$Sub_metering_1,type="n",xlab="",
     ylab='Energy Sub Metering')
lines(data$timestamp,data$Sub_metering_1,type="l",col='black')
lines(data$timestamp,data$Sub_metering_2,type="l",col='red')
lines(data$timestamp,data$Sub_metering_3,type="l",col='blue')
legend_txt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", lty= 1, col = c("black","blue", "red"), legend = legend_txt)
dev.off ();