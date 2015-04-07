#plot1.R
#Creates a plot for the global active power

setwd("~/Documents/coursera/exploratoryData/ExData_Plotting1/")

#Read the datasets
householdTotal <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#convert the date column to POSIX date format
householdTotal$Date <- as.Date(householdTotal$Date, format="%d/%m/%Y")

#subset the data to only include the dates of 2007/02/01-2007-02/02
householdSubset <- householdTotal[(householdTotal$Date >= "2007-02-01" & householdTotal$Date < "2007-02-03"),]

# make the PNG and plot it
png("plot1.png", width=480, height=480)
hist(householdSubset$Global_active_power, xlab="Global Active Power (kilowats)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()