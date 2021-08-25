# plot1.R

#Read data and subset for only Feb 1 & Feb 2, 2007
setwd("C:/GitHub/GettingCleaningData/ProgrammingAssignment/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
plotData <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
#Clear up memory..
rm(data)

# concatenate date & time for strptime and convert character strings
datetime <- paste(plotData$Date, plotData$Time, sep=" ")
plotData$Time <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
rm(datetime)
plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")

png(filename="plot1.png", width=480, height=480)
hist(plotData$Global_active_power, main="Global Active Power", xlab="Global Active Power (Kilowatts)", col="Red")
dev.off()
