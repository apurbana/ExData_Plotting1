## Plot 4

cClasses<-c("character","character","double","double","double","double","double","double","double")

epc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                colClasses=cClasses, na.strings="?")

epc1<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
epc2<-epc1
time <- paste(epc2$Date, epc2$Time)
epc2$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")

png(filename = "plot5.png",width = 480, height = 480)
#windows(width=10, height=8)

par(mfrow=c(2,2))

epc2<-epc1
time <- paste(epc2$Date, epc2$Time)
epc2$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")
plot(epc2$Time, epc2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l")

plot(epc2$Time, epc2$Voltage, xlab="datetime", type="l", ylab="Voltage")

plot(epc2$Time, epc2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black", ylim=c(0,42))
lines(epc2$Time, epc2$Sub_metering_2, col="red")
lines(epc2$Time, epc2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), cex=0.7, bty="n")

plot(epc2$Time, epc2$Global_reactive_power, xlab="datetime", type="l", ylab="Global_reactive_power")

dev.off()