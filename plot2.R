#Reading data into R
# Change file path to read data 

consumption<- read.table("data/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
consumption$DateTime <- paste(as.character(consumption$Date), as.character(consumption$Time), sep = " ")
consumption$DateTime <- strptime(consumption$DateTime,"%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption, Date == "2007-02-01" | Date == "2007-02-02")
# Above  steps are common for all  plots

# Creating plot2
png("plot2.png", width=480, height= 480)
plot(two.days$DateTime, two.days$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (Kilowatts)", xlab="")
dev.off()








