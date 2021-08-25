# plot1.R

#Read data and subset for only Feb 1 & Feb 2, 2007
setwd("C:/GitHub/GettingCleaningData/ProgrammingAssignment/ExData_Plotting1")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
plotData <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
#Clear up memory..
rm(data)

# concatenate date & time for strptime and convert character strings
datetime <- paste(plotData$Date, plotData$Time, sep=" ")
plotData$Time <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
rm(datetime)
plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
