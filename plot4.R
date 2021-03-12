power_path <- './household_power_consumption.txt'

col_names <- read.table(power_path, sep=';', nrows=1)

colnames <- as.list(col_names[1,])

power_data <- read.table(power_path, sep = ';', skip=1, col.names = colnames)

power_subset <- subset(power_data, power_data$Date == '1/2/2007' | power_data$Date == '2/2/2007')

power_subset$Date <- as.Date(power_subset$Date,"%d/%m/%Y")

dates <- as.POSIXct(paste(power_subset$Date, power_subset$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
with(power_subset, {
  
  plot(dates, power_subset$Global_active_power, ylab = 'Global Active Power(kilowatts)', type='l')
  plot(dates, power_subset$Voltage, ylab='Voltage', type='l')
  plot(dates, power_subset$Sub_metering_1, type='l',col='black', ylab='Energy Sub Metering')
  lines(dates, power_subset$Sub_metering_2, col='red')
  lines(dates, power_subset$Sub_metering_3, col='blue')
  legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty=1)
  plot(dates, power_subset$Global_reactive_power, ylab='Gobal_reactive_power', type='l')
})