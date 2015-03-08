## read in dataset
all_data <- read.csv("~/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## change date format
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## subset data to get desired date range
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## plot 3
with(data, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='red')
  lines(Sub_metering_3~datetime,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## save file
dev.copy(png, file="~/plot3.png", height=480, width=480)
dev.off()