# plo2.R
# global active power line graph

setwd("~/Documents/coursera/exploratoryData/ExData_Plotting1/")

#Read the datasets
householdTotal <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert the date column to POSIX date format
householdTotal$Time <- as.POSIXct(paste(householdTotal$Date, householdTotal$Time), format="%d/%m/%Y %H:%M:%S")
householdSubset <- householdTotal[(householdTotal$Time >= "2007-02-01" & householdTotal$Time < "2007-02-03"),]

# Create and output plot as png
png("plot2.png", width=480, height=480)
plot(householdSubset$Time, householdSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowats)")
dev.off()
