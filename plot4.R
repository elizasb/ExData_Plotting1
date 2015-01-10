## File: plot4.R
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

# Plot 4- 2x2 plots
png("plot4.png",width = 480, height = 480, units = "px") 
par(mfrow = c(2, 2),cex=0.8)
with(data,{
  #graph1
  plot(timestamp,Global_active_power,type="n",xlab="",ylab='Global Active Power')
  lines(timestamp,Global_active_power,type="l")
  #graph2
  plot(timestamp,Voltage,type="n",xlab="datetime")
  lines(timestamp,Voltage,type="l")
  #graph3
  plot(timestamp,Sub_metering_1,type="n",xlab="",ylab='Energy sub metering')
  lines(timestamp,Sub_metering_1,type="l",col='black')
  lines(timestamp,Sub_metering_2,type="l",col='red')
  lines(timestamp,Sub_metering_3,type="l",col='blue')
  legend_txt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright", lty= 1, bty = "n", col = c("black","blue", "red"), legend = legend_txt)
  #graph4
  plot(timestamp,Global_reactive_power,type="n",xlab="datetime")
  lines(timestamp,Global_reactive_power,type="l")  
  dev.off ();
})