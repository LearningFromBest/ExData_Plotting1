##read data
ta<- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
newdata <- subset(ta, Date == "1/2/2007" | Date == "2/2/2007")

##change into date
myformat<- "%d/%m/%y"
newdata$Date <- as.Date(newdata$Date,myformat)

##draw
hist(newdata$Global_active_power,col = "red",xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

##copy to file device
dev.copy(png, file = "plot1.png")
dev.off()
