## Plot 2

cClasses<-c("character","character","double","double","double","double","double","double","double")

epc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                colClasses=cClasses, na.strings="?")

epc1<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]
epc2<-epc1
time <- paste(epc2$Date, epc2$Time)
epc2$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)
plot(epc2$Time, epc2$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()

