 #set wd
        setwd("~/R/win-library/3.0/Assignment/Exploratory Data Analysis/Project 1")
        #read household_power_consumption.txt
        consumption <- read.csv("./household_power_consumption.txt",sep = ";", header=T)
        #sub dates
        date01 <- consumption[consumption$Date == '1/2/2007',]
        date02 <- consumption[consumption$Date == '2/2/2007',]
        power2007 <- rbind(date01, date02)
        dat <-as.character(power2007$Global_active_power)
        dat <-as.numeric(dat)
        
        #nameday in to sub
        dayname <- strptime(paste(power2007$Date, power2007$Time), format='%d/%m/%Y %H:%M:%S')
        
        dat1 <- power2007$Sub_metering_1
        dat2 <- power2007$Sub_metering_2
        dat3 <- power2007$Sub_metering_3
        
        dat_sub <- c(dat1, dat2, dat3)
        #creating plot 3
        
        png(file="plot3.png")
        
        #creating plots for dat1,dat2,dat3
        plot(dayname, dat1, ylim=range(dat_sub), xlab="", ylab="Energy sub meeting", 
             col="black", type="l")
        lines(dayname, dat2, col="red")
        lines(dayname, dat3, col="blue")
        #legend
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black", "red", "blue"), 
               lty = 1)
        dev.off()
