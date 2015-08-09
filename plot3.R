library(dplyr)
data <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = FALSE, na.string='?')
power <- filter(data, Date == '1/2/2007' | Date == '2/2/2007')
#parse the date time
power$date_time <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %H:%M:%S')
png('plot3.png')
plot(power$date_time, power$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power$date_time, power$Sub_metering_2, col='Red')
lines(power$date_time, power$Sub_metering_3, col='Blue')
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

