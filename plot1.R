ta<- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
newdata <- subset(ta, Date == "1/2/2007" | Date == "2/2/2007")
myformat<- "%d/%m/%y"
newdata$Date <- as.Date(newdata$Date,myformat)
hist(newdata$Global_active_power,col = "red",xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png, file = "png1.png")
dev.off()
