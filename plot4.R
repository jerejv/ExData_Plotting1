## Reads household power consumption data into table
readData <- function()
{
  if(!file.exists("./ExData_Plotting1")){dir.create("./ExData_Plotting1")}
  if(!file.exists("./ExData_Plotting1/household_power_consumption.txt"))
  {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl,destfile="./ExData_Plotting1/data.zip",mode="wb")
    unzip("./ExData_Plotting1/data.zip",exdir="./ExData_Plotting1")
  }
  classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
  read.table("./ExData_Plotting1/household_power_consumption.txt", header=TRUE, sep=";", colClasses = classes, na.strings = "?")
}

## Filters data for dates 1/2/2007 and 2/2/2007 and graphs it as plot1
data <- readData()
filteredData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
filteredData$datetime <- strptime(paste(filteredData$Date,filteredData$Time), '%d/%m/%Y %H:%M:%S')
png("plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(1,0,1,0))
plot(filteredData$datetime,filteredData$Global_active_power, type="l", ylab="Global Active Power", xlab=NA)
plot(filteredData$datetime,filteredData$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(filteredData$datetime,filteredData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
lines(filteredData$datetime,filteredData$Sub_metering_2, col="red")
lines(filteredData$datetime,filteredData$Sub_metering_3, col="blue")
legend("topright",col=c("black","blue","red"),legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"), lty=1, bty="n")
plot(filteredData$datetime,filteredData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", yaxt='n')
axis(side=2,at=c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c("0.0","0.1","0.2","0.3","0.4","0.5"))
dev.off()