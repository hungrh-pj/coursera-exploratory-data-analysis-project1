filePath <- "./data/household_power_consumption.txt"
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#   Date and Time colum
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#  get global active power info
globalActivePower <- as.numeric(filteredData$Global_active_power)

#  plot in file. Width and height info extracted from instruction's image
png("plot2.png", width=504, height=504)

#  plot x and y axes
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#  shuts down current device
dev.off()
