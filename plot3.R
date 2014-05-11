#Reading data into R
# Change file path to read data 

consumption<- read.table("data/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
consumption$DateTime <- paste(as.character(consumption$Date), as.character(consumption$Time), sep = " ")
consumption$DateTime <- strptime(consumption$DateTime,"%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption, Date == "2007-02-01" | Date == "2007-02-02")
# Above  steps are common for all  plots

# Creating plot 3
png("plot3.png", width = 480, height = 480)
plot(consumption$DateTime, consumption$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(consumption$DateTime, consumption$Sub_metering_2, type="l", col="red")
lines(consumption$DateTime, consumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
