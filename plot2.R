##read data
ta<- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
newdata <- subset(ta, Date == "1/2/2007" | Date == "2/2/2007")

date<-as.character(newdata$Date)
time<-as.character(newdata$Time)

##paste the date and time into one string, then change it into POSIXlt.
datestr<-paste(date,time)
t<-strptime(datestr," %d/%m/%Y %H:%M:%S") 

##draw
with(newdata,plot(t,Global_active_power, ylab="Global Active Power (kilowatts)", type = "l"))

##copy to file device
dev.copy(png, file = "plot2.png")
dev.off()