# assumption: household_power_consumption.txt is under working dir

# read data
col_classes <- c(rep('character',2), rep('numeric', 7))
file_path <- 'household_power_consumption.txt'
titles <- as.character(read.table(file_path, sep=";", nrows=1, colClasses='character')[1,])
dat <- read.table(file_path, header=FALSE, sep=";", na.strings="?", col.names=titles, colClasses=col_classes, skip=66637, nrows=2880)
dat$datetime <- strptime(paste(dat$Date, dat$Time), format='%d/%m/%Y %H:%M:%S')

# plot
png('plot2.png')
plot(dat$datetime, dat$Global_active_power, type='s', xlab='', ylab='Global Active Power (Kilowatts)')
dev.off()