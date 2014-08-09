setwd("~/Coursera/ExData_Plotting1/")
# read in data:
data = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=-1,colClasses=c(rep("character",2),rep("numeric",5)),na.strings="?")
# convert format of Date column from %d/%m/%Y to %Y-%m-%d:
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset rows of interest
subsetdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
# convert dates again to get day of the week:
subsetdata$Date<-format(strptime(paste(subsetdata$Date, subsetdata$Time), "%Y-%m-%d %H:%M:%S"),"%a")
# remove full data set as not required for plot:
rm(data)
# generate plot and send straight to png file:
png("plot3.png",width=480,height=480)
par(mar=c(4,5,2,2))
plot(subsetdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",xaxt="n")
lines(subsetdata$Sub_metering_2,col="red")
lines(subsetdata$Sub_metering_3,col="blue")
midpoint=length(subsetdata$Date[subsetdata$Date=="Thu"])
endpoint=length(subsetdata$Date)
axis(1,at=c(1,midpoint,endpoint), label=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
rm(subsetdata)