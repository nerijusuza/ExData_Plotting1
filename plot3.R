#Create a folder
if(!file.exists("./Class_4")) {
        dir.create("./Class_4")
}
data3 <- read.csv("Class_4/household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?",
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
Final <- data3[(data3$Date == "1/2/2007" | data3$Date == "2/2/2007"), ]
Final$unixTime = strptime(paste(Final$Date, Final$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "Class_4/plot3.png", width = 480, height = 480)
plot(c(Final$unixTime,Final$unixTime,Final$unixTime), c(Final$Sub_metering_1, Final$Sub_metering_2, Final$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(Final$unixTime, Final$Sub_metering_1, col="black")
lines(Final$unixTime, Final$Sub_metering_2, col="red")
lines(Final$unixTime, Final$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))

dev.off()