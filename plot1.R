power_path <- './household_power_consumption.txt'

col_names <- read.table(power_path, sep=';', nrows=1)

colnames <- as.list(col_names[1,])

power_data <- read.table(power_path, sep = ';', skip=1, col.names = colnames)

power_subset <- subset(power_data, power_data$Date == '1/2/2007' | power_data$Date == '2/2/2007')

power_subset$Date <- as.Date(power_subset$Date)

hist(as.numeric(power_subset$Global_active_power), col='red', xlab = 'Global Active Power(kilowatts)', main='Global Active Power')



