#Create a folder
if(!file.exists("./Class_4")) {
        dir.create("./Class_4")
}
data2 <- read.csv("Class_4/household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?",
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
Final <- data2[(data2$Date == "1/2/2007" | data2$Date == "2/2/2007"), ]
Final$unixTime = strptime(paste(Final$Date, Final$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "Class_4/plot2.png", width = 480, height = 480)
plot(Final$unixTime, Final$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(Final$unixTime, Final$Global_active_power)

dev.off()