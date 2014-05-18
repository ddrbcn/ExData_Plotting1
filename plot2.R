#reading data
data = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
datetime<-as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S'))
data2<-cbind(data,datetime)

#plot
plot(data2$datetime,data2$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l" )