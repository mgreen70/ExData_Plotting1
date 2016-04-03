file <- "household_power_consumption-2.txt"
df <- read.table(file,sep = ";", header= T, na.strings = "?", stringsAsFactors = F)

dt <- as.Date(df$Date,"%d/%m/%Y")
df['dtime'] <- dt
df <- df[df$dtime == "2007-02-01" | df$dtime == "2007-02-02",]



dt2 <- paste(df$Date,df$Time)

d3 <- strptime(dt2, format = "%d/%m/%Y %H:%M:%S")

d4 <- data.frame(d3)
df['d3'] <- d4$d3


yticks <- c(0, 10, 20,30)

plot(df$d3,df$"Sub_metering_3",xlab="",yaxt="n",type="l",col="blue",ylab="",ylim=range(c(df$"Sub_metering_1",df$"Sub_metering_2",df$"Sub_metering_3")))
axis(2, at = yticks, labels = yticks, las=2)

par(new=T)

plot(df$d3,df$"Sub_metering_1",type="l",xlab="",col="black",yaxt="n",ylab="",ylim=range(c(df$"Sub_metering_1",df$"Sub_metering_2",df$"Sub_metering_3")))
axis(2, at = yticks, labels = yticks, las=2)

par(new=T)

plot(df$d3,df$"Sub_metering_2",type="l",xlab="",col="red",yaxt="n",ylab="Energy sub metering",ylim=range(c(df$"Sub_metering_1",df$"Sub_metering_2",df$"Sub_metering_3")))
axis(2, at = yticks, labels = yticks, las=2)
legend("topright",lwd=c(1,1,1),col=c("black","red","blue"),legend = c("sub_metering_1 ", "sub_metering_2 ","sub_metering_3 "))
dev.copy(png,'plot3.png')
dev.off()

