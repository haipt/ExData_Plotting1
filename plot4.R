library(dplyr)
data <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = FALSE, na.string='?')
power <- filter(data, Date == '1/2/2007' | Date == '2/2/2007')
#parse the date time
power$date_time <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %H:%M:%S')
png('plot4.png')
par(mfrow = c(2, 2))
plot(power$date_time, power$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
plot(power$date_time, power$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(power$date_time, power$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power$date_time, power$Sub_metering_2, col='Red')
lines(power$date_time, power$Sub_metering_3, col='Blue')
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(power$date_time, power$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
dev.off()

