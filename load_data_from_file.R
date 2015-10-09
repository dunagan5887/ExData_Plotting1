powerConsumptionSubsetLoaderFactory <- function()
{
    total_rows <- 3000;
    total_columns <- 9;
    column_classes <- c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric');
    column_names <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3');
    na_values <- c('?', '');
    data_subset_file_name <- 'subset.csv';
    data_subset_file_delimiter <- ';';
    
    target_start_date <- '2007-02-01';
    target_end_date <- '2007-02-02';
    
    readInDataFromFile <- function()
    {
        powerConsumptionDataFrame <- read.csv(file = data_subset_file_name,
                                  sep = data_subset_file_delimiter,
                                  comment.char = "",
                                  col.names = column_names,
                                  na.strings = na_values,
                                  colClasses = column_classes,
                                  nrows = total_rows);
        
        powerConsumptionDataFrame$Date <- as.Date(powerConsumptionDataFrame$Date, format = "%d/%m/%Y");
        powerConsumptionDataFrame$timestamp <- paste(powerConsumptionDataFrame$Date, powerConsumptionDataFrame$Time);
        powerConsumptionDataFrame$Time <- strptime(powerConsumptionDataFrame$timestamp, format = "%Y-%m-%d %H:%M:%S")
        
        invisible(powerConsumptionDataFrame);
    }
    
    estimateFileSize <- function()
    {
        numeric_bytes_per_row <- 7 * 8;
        character_bytes_per_row <- 208;
        time_bytes_per_row <- 1816;
        date_bytes_per_row <- 256;
        bytes_per_row <- time_bytes_per_row + date_bytes_per_row + numeric_bytes_per_row + character_bytes_per_row;
        print(paste0("bytes_per_row: ", bytes_per_row));
        total_bytes <- total_rows * bytes_per_row;
        print(paste0("total_bytes: ", total_bytes));
    }
    
    list (estimateFileSize = estimateFileSize,
          readInDataFromFile = readInDataFromFile)
}

getPowerUsageDataFrame <- function()
{
    powerConsumptionSubsetLoaderFactoryInstance <- powerConsumptionSubsetLoaderFactory();
    powerConsumptionDataFrame <- powerConsumptionSubsetLoaderFactoryInstance$readInDataFromFile();
    invisible(powerConsumptionDataFrame);
}
