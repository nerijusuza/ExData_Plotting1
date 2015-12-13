#Create a folder
if(!file.exists("./Class_4")) {
        dir.create("./Class_4")
}
data1 <- read.csv("Class_4/household_power_consumption.txt", sep = ";", dec = ".", na.strings = "?",
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
Final <- data1[(data1$Date == "1/2/2007" | data1$Date == "2/2/2007"), ]
png(filename = "Class_4/plot1.png", width = 480, height = 480)
hist(Final$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()