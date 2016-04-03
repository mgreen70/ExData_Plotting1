file <- "household_power_consumption-2.txt"
df <- read.table(file,sep = ";", header= T, na.strings = "?", stringsAsFactors = F)

dt <- as.Date(df$Date,"%d/%m/%Y")
df['dtime'] <- dt
df <- df[df$dtime == "2007-02-01" | df$dtime == "2007-02-02",]

hist(df$"Global_active_power",  col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()
