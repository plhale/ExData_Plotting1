        #read household_power_consumption.txt
        consumption <- read.csv("./household_power_consumption.txt",sep = ";", header=T)
        #sub dates
        date01 <- consumption[consumption$Date == '1/2/2007',]
        date02 <- consumption[consumption$Date == '2/2/2007',]
        power2007 <- rbind(date01, date02)
        dat <-as.character(power2007$Global_active_power)
        dat <-as.numeric(dat)
        
        #plot 4
        
        dayname <- strptime(paste(power2007$Date, power2007$Time), format='%d/%m/%Y %H:%M:%S')
        
        active_power <- power2007$Global_active_power
        reactive_power <- power2007$Global_reactive_power
        voltage <- power2007$Voltage
        
        #sub metering
        dat1 <- power2007$Sub_metering_1
        dat2 <- power2007$Sub_metering_2
        dat3 <- power2007$Sub_metering_3
        
        dat_sub <- c(dat1, dat2, dat3)
        
        png(file = "plot4.png")
        par(mfrow = c(2,2))
        
        plot(dayname, active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
        
        plot(dayname, voltage, xlab="date/time", ylab="Voltage", type="l")
        
        plot(dayname, dat1, ylim=range(dat_sub), xlab="", ylab="Energy sub meeting", 
             col="black", type="l")
        lines(dayname, dat2, col="red")
        lines(dayname, dat3, col="blue")
        #legend
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black", "red", "blue"), 
               lty = 1, bty="n")
        
        plot(dayname, reactive_power, xlab="date/time", ylab="Global_reactive_power", type="l") 
        
        
        dev.off()
