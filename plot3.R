# plot3.R

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

# create data object from string
plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")

#Create the plot
png(filename = "plot3.png", width=480, height=480)
plot(plotData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", axes="FALSE")
lines(plotData$Sub_metering_2, type="l", col="red")
lines(plotData$Sub_metering_3, type="l", col="blue")
box(which="plot", lty="solid")
axis(1, at=c(0,1440,2880), labels=c("Thursday", "Friday", "Saturday"))
axis(2)
legend("topright", legend = c(colnames(plotData)[7], colnames(plotData)[8], colnames(plotData)[9]),lty=1, col=c("black","red","blue"))

dev.off()
