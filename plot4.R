#reading data
data = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
datetime<-as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S'))
data2<-cbind(data,datetime)

par(mfrow=c(2,2))

#plot1
plot(data2$datetime,data2$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l" )

#plot2
plot(data2$datetime,data2$Voltage, ylab="Voltage", xlab="datetime", type="l" )

#plot3
plot(data2$datetime,data2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black", legend=c("sub_metering_1  ","sub_metering_2  ","sub_metering_3  "))
lines(data2$datetime,data2$Sub_metering_2,col="red")
lines(data2$datetime,data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))

#plot4
plot(data2$datetime,data2$Global_reactive_power, xlab="datime", ylab="Global_reactive_power", type="l" )