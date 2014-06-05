setwd("C://Users//narjunan//Documents//01EDA")
tb5rows<-read.table("household_power_consumption.txt",header=TRUE,sep=";"
                    ,stringsAsFactors=TRUE)
tb5rows$Date <-as.Date(tb5rows$Date,"%d/%m/%Y")
subsetFile <- tb5rows[tb5rows$Date >= as.Date("2007-02-01") & tb5rows$Date <= as.Date("2007-02-02"), ] 
tb5rows$datetime<-as.POSIXlt(paste(tb5rows$Date, tb5rows$Time), format="%Y-%m-%d %H:%M:%S")

### Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot( subsetFile$datetime, 
      as.numeric(subsetFile$Sub_metering_1), 
      type = "n",
      xlab = "", 
      ylab = "Energy sub metering" 
)
lines(subsetFile$datetime, 
      as.numeric(subsetFile$Sub_metering_1), col = "black" )
lines(subsetFile$datetime, 
      as.numeric(subsetFile$Sub_metering_2), col = "red" )
lines( subsetFile$datetime, 
       as.numeric(subsetFile$Sub_metering_3), col = "blue" )

legend(
  "topright", 
  c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), 
  lty = c( 1, 1, 1 ), 
  lwd = c( 2, 2, 2 ),
  col = c( "black", "red", "blue" )
)

dev.off()
