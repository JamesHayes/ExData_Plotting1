# plo4.R
# combined plots

setwd("~/Documents/coursera/exploratoryData/ExData_Plotting1/")

#Read the datasets
householdTotal <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert the date column to POSIX date format
householdTotal$Time <- as.POSIXct(paste(householdTotal$Date, householdTotal$Time), format="%d/%m/%Y %H:%M:%S")
householdSubset <- householdTotal[(householdTotal$Time >= "2007-02-01" & householdTotal$Time < "2007-02-03"),]

# Create and output plot as png
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(householdSubset$Time, householdSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(householdSubset$Time, householdSubset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(householdSubset$Time, householdSubset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(householdSubset$Time, householdSubset$Sub_metering_2, col="red")
lines(householdSubset$Time, householdSubset$Sub_metering_3, col="blue")
legend("topright", bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
plot(householdSubset$Time, householdSubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
