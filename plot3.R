source('./load_data_from_file.R');

powerConsumptionDataFrame <- getPowerUsageDataFrame();


plot(x=powerConsumptionDataFrame$Time, y=powerConsumptionDataFrame$Sub_metering_1, type="l", col="Black",
     main ='', xlab='', ylab='Energy sub metering');
points(x=powerConsumptionDataFrame$Time, y=powerConsumptionDataFrame$Sub_metering_2, type="l", col="Red");
points(x=powerConsumptionDataFrame$Time, y=powerConsumptionDataFrame$Sub_metering_3, type="l", col="Blue");
legend("topright", box.col="Black", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("Black","Red","Blue"));

dev.copy(png, file="plot3.png", width=480, height=480);
dev.off();