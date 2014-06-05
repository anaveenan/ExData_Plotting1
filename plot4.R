setwd("C://Users//narjunan//Documents//01EDA")
tb5rows<-read.table("household_power_consumption.txt",header=TRUE,sep=";"
                    ,stringsAsFactors=TRUE)
tb5rows$Date <-as.Date(tb5rows$Date,"%d/%m/%Y")
subsetFile <- tb5rows[tb5rows$Date >= as.Date("2007-02-01") & tb5rows$Date <= as.Date("2007-02-02"), ] 
tb5rows$datetime<-as.POSIXlt(paste(tb5rows$Date, tb5rows$Time), format="%Y-%m-%d %H:%M:%S")

### Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par( mfrow = c( 2, 2 ) )

## plot Global Active Power
plot( subsetFile$datetime, 
      subsetFile$Global_active_power, 
      type = "l", 
      ylab = "Global Active Power", 
      xlab = "" )

## Plot the Voltage by the date and time
plot( subsetFile$datetime,
      as.numeric(subsetFile$Voltage), 
      type = "l", 
      ylab = "Voltage", 
      xlab = "datetime")

## plot Sub_metering
plot( subsetFile$datetime,
      as.numeric(subsetFile$Sub_metering_1), 
      type = "n",
      xlab = "", 
      ylab = "Energy Sub Metering")
##Add lines
lines( subsetFile$datetime,
       as.numeric(subsetFile$Sub_metering_1), 
       col = "black")
lines( subsetFile$datetime,
       as.numeric(subsetFile$Sub_metering_2), 
       col = "red")
lines( subsetFile$datetime, 
       as.numeric(subsetFile$Sub_metering_3), 
       col = "blue")
##Add legend
legend( "topright", 
        c( "Sub_metering_1",
           "Sub_metering_2", 
           "Sub_metering_3"), 
        lty = c( 1, 1, 1 ), 
        lwd = c( 2, 2, 2 ), 
        col = c( "black", "red", "blue" ) )

## plot Global_reactive_power
plot(subsetFile$datetime, 
     as.numeric(subsetFile$Global_reactive_power), 
     type="l", 
     ylab="Global_reactive_power", 
     xlab="datetime"
)

dev.off()
