# read data
power = read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,header=TRUE)

# create a new date-time variable
power$datetime = paste(power$Date,power$Time)
power$datetime = strptime(power$datetime,"%d/%m/%Y %H:%M:%S")

# subset data
powersub = subset(power,power$datetime>="2007-02-01 00:00:00" & power$datetime<"2007-02-03 00:00:00")

# convert variable classes
powersub[,3:9]<-sapply(powersub[,3:9],as.numeric)

# multi-plots (plot 4)
opar=par()
par(mfrow=c(2,2))

plot(powersub$datetime,powersub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(powersub$datetime,powersub$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(powersub$datetime,powersub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(powersub$datetime,powersub$Sub_metering_2,col="red")
lines(powersub$datetime,powersub$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

plot(powersub$datetime,powersub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab = "datetime")

# save as png
dev.copy(png,file="plot4.png")
dev.off()