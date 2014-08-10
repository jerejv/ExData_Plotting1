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
png("plot1.png")
hist(filteredData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()