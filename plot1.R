#reading data

data = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

#histogram
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")