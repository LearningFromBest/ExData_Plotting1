##read data
ta<- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
newdata <- subset(ta, Date == "1/2/2007" | Date == "2/2/2007")

date<-as.character(newdata$Date)
time<-as.character(newdata$Time)

##paste the date and time into one string, then change it into POSIXlt.
datestr<-paste(date,time)
t<-strptime(datestr," %d/%m/%Y %H:%M:%S") 

##draw
par(mfrow=c(2,2))
with(newdata,{
  plot(t,Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
  plot(t,Voltage,type = "l", xlab= "datetime", ylab="Voltage")
  plot(t,Sub_metering_1,type = "l", xlab="", ylab="Energy sub metering")
  lines(t,Sub_metering_2,type = "l", col = "red")
  lines(t,Sub_metering_3,type = "l", col = "blue")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,col= c('black', 'red','blue'))
  plot(t,Global_reactive_power,type = "l", xlab= "datetime")     
         
})

##copy to file device
dev.copy(png, file = "plot4.png")
dev.off()
