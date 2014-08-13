#read household_power_consumption.txt
        consumption <- read.csv("./household_power_consumption.txt",sep = ";", header=T)
        #sub dates
        date01 <- consumption[consumption$Date == '1/2/2007',]
        date02 <- consumption[consumption$Date == '2/2/2007',]
        power2007 <- rbind(date01, date02)
        dat <-as.character(power2007$Global_active_power)
        dat <-as.numeric(dat)
        
        dayname <- strptime(paste(power2007$Date, power2007$Time), format='%d/%m/%Y %H:%M:%S')
        png("plot2.png")
        #create plot
        plot(dayname, power2007$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
