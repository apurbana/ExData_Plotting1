## Plot 3

cClasses<-c("character","character","double","double","double","double","double","double","double")

epc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                colClasses=cClasses, na.strings="?")

epc1<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
epc2<-epc1
time <- paste(epc2$Date, epc2$Time)
epc2$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",width = 480, height = 480)
plot(epc2$Time, epc2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black", ylim=c(0,42))
lines(epc2$Time, epc2$Sub_metering_2, col="red")
lines(epc2$Time, epc2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()
