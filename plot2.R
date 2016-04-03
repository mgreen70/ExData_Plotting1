file <- "household_power_consumption-2.txt"
df <- read.table(file,sep = ";", header= T, na.strings = "?", stringsAsFactors = F)

dt <- as.Date(df$Date,"%d/%m/%Y")
df['dtime'] <- dt
df <- df[df$dtime == "2007-02-01" | df$dtime == "2007-02-02",]

dt2 <- paste(df$Date,df$Time)

d3 <- strptime(dt2, format = "%d/%m/%Y %H:%M:%S")

d4 <- data.frame(d3)
df['d3'] <- d4$d3


plot(df$d3,df$"Global_active_power", type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()
