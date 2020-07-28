
setwd("C:/Users/devdas2/Desktop/Cert_R_Projects/ExData_Plotting1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?",""))

data1 <- data

rm(data)

subsetted_data <- subset(data1, data1$Date == "1/2/2007" | data1$Date == "2/2/2007")

subsetted_data$Date <- as.Date(subsetted_data$Date , format = "%d/%m/%Y")
subsetted_data$temp <- paste(subsetted_data$Date,subsetted_data$Time)
subsetted_data$Time <- strptime(subsetted_data$temp, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", width = 700, height = 700)
par(mfrow = c(2, 2))
with(subsetted_data, {
  plot(x = subsetted_data$Time, y = subsetted_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x = subsetted_data$Time, y = subsetted_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(x = subsetted_data$Time, y = subsetted_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = subsetted_data$Time, y = subsetted_data$Sub_metering_2, type = "l", col = "red")
  lines(x = subsetted_data$Time, y = subsetted_data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x = subsetted_data$Time, y =subsetted_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()