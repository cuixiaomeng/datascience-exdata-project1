# read data
power = read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,header=TRUE)

# create a new date-time variable
power$datetime = paste(power$Date,power$Time)
power$datetime = strptime(power$datetime,"%d/%m/%Y %H:%M:%S")

# subset data
powersub = subset(power,power$datetime>="2007-02-01 00:00:00" & power$datetime<"2007-02-03 00:00:00")

# convert variable classes
powersub[,3:9]<-sapply(powersub[,3:9],as.numeric)

# histogram (plot 1)
hist(powersub$Global_active_power,col="red",freq=TRUE, main=paste("Global Active Power"),xlab="Global Active Power (kilowatts)")

# save as png
dev.copy(png,file="plot1.png")
dev.off()