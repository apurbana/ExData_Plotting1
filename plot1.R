

## Plot 1

cClasses<-c("character","character","double","double","double","double","double","double","double")

epc<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                colClasses=cClasses, na.strings="?")

epc1<-epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

png(filename = "plot1.png",width = 480, height = 480)

hist(epc1$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     xlim=c(0,7), ylim=c(0,1300))
dev.off()
