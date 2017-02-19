filePath <- "./data/household_power_consumption.txt"
data <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#  get global active power info
globalActivePower <- as.numeric(filteredData$Global_active_power)

#  plot in file. Width and height info extracted from instruction's image
png("plot1.png", width=504, height=504)

#  computes a histogram of the given data values
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#  shuts down current device
dev.off()
