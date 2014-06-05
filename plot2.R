setwd("C://Users//narjunan//Documents//01EDA")
tb5rows<-read.table("household_power_consumption.txt",header=TRUE,sep=";"
                    ,stringsAsFactors=TRUE)
tb5rows$Date <-as.Date(tb5rows$Date,"%d/%m/%Y")
subsetFile <- tb5rows[tb5rows$Date >= as.Date("2007-02-01") & tb5rows$Date <= as.Date("2007-02-02"), ] 
tb5rows$datetime<-as.POSIXlt(paste(tb5rows$Date, tb5rows$Time), format="%Y-%m-%d %H:%M:%S")

### Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(subsetFile$datetime,as.numeric(subsetFile$Global_active_power),
     ,ylab="Global Active Power (Kilowatts)",type="l",xlab="")
dev.off()
