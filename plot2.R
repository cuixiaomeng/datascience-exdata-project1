# read data
power = read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,header=TRUE)

# create a new date-time variable
power$datetime = paste(power$Date,power$Time)
power$datetime = strptime(power$datetime,"%d/%m/%Y %H:%M:%S")

# subset data
powersub = subset(power,power$datetime>="2007-02-01 00:00:00" & power$datetime<"2007-02-03 00:00:00")

# convert variable classes
powersub[,3:9]<-sapply(powersub[,3:9],as.numeric)

# line chart (plot 2)
plot(powersub$datetime,powersub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# save as png
dev.copy(png,file="plot2.png")
dev.off()