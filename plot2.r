setwd("C:/Users/devdas2/Desktop/Cert_R_Projects/ExData_Plotting1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?",""))

data1 <- data

rm(data)

subsetted_data <- subset(data1, data1$Date == "1/2/2007" | data1$Date == "2/2/2007")

subsetted_data$Date <- as.Date(subsetted_data$Date , format = "%d/%m/%Y")
subsetted_data$temp <- paste(subsetted_data$Date,subsetted_data$Time)
subsetted_data$Time <- strptime(subsetted_data$temp, format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(subsetted_data$Time, subsetted_data$Global_active_power, type = "l", lty = 1, 
     ylab = "Global Active Power (kilowatts)", xlab = ""
     )
dev.off()