library(dplyr)
data <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors = FALSE, na.string='?')
power <- filter(data, Date == '1/2/2007' | Date == '2/2/2007')
#parse the date time
power$date_time <- strptime(paste(power$Date, power$Time), '%d/%m/%Y %H:%M:%S')
png('plot1.png')
hist(power$Global_active_power, col="Red", main="Global Active Power", xlab = 'Global Active Power (kilowatts)')
dev.off()

