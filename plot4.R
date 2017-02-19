filePath <- "./data/household_power_consumption.txt"
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#   Date and Time colum
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#  get global active power info
globalActivePower <- as.numeric(filteredData$Global_active_power)

#  get global reactive power info
globalReactivePower <- as.numeric(filteredData$Global_reactive_power)

#  get voltage info
voltage <- as.numeric(filteredData$Voltage)

#  get sub metering info
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

#  plot in file. Width and height info extracted from instruction's image
png("plot4.png", width=504, height=504)

#  set or query graphical parameters to 2 x 2 pictures on one plot
par(mfrow = c(2, 2)) 

#  plot 1x1 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#  plot 1x2 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#  plot 2x1 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#  plot 2x2 
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#  shuts down current device
dev.off()

