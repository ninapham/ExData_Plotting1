## read in dataset
all_data <- read.csv("~/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## change date format
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## subset data to get desired date range
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save file
dev.copy(png, file="~/plot1.png", height=480, width=480)
dev.off()
