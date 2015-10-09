source('./load_data_from_file.R');

powerConsumptionDataFrame <- getPowerUsageDataFrame();

hist(powerConsumptionDataFrame$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     col = 'Red'
 );

dev.copy(png, file="plot1.png", width=480, height=480);
dev.off();
