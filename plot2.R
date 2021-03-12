power_path <- './household_power_consumption.txt'

col_names <- read.table(power_path, sep=';', nrows=1)

colnames <- as.list(col_names[1,])

power_data <- read.table(power_path, sep = ';', skip=1, col.names = colnames)

power_subset <- subset(power_data, power_data$Date == '1/2/2007' | power_data$Date == '2/2/2007')

power_subset$Date <- as.Date(power_subset$Date,"%d/%m/%Y")

dates <- as.POSIXct(paste(power_subset$Date, power_subset$Time), format="%Y-%m-%d %H:%M:%S")

plot(dates, power_subset$Global_active_power, main='Global Active Power v/s Time', ylab = 'Global Active Power(kilowatts)', type='l')
