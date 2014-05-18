#reading data
data = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
datetime<-as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S'))
data2<-cbind(data,datetime)

#plot
plot(data2$datetime,data2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
lines(data2$datetime,data2$Sub_metering_2,col="red")
lines(data2$datetime,data2$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))