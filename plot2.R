source('./load_data_from_file.R');

powerConsumptionDataFrame <- getPowerUsageDataFrame();

plot(x=powerConsumptionDataFrame$Time, 
     y=powerConsumptionDataFrame$Global_active_power,
     type="l",
     main = '',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)',);

dev.copy(png, file="plot2.png", width=480, height=480);
dev.off();
