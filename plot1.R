setwd("~/Coursera/ExData_Plotting1/")
# read in data:
data = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=-1,colClasses=c(rep("character",2),rep("numeric",5)),na.strings="?")
# convert format of Date column: %d/%m/%Y to %Y-%m-%d
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset rows of interest
subsetdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
# remove full data set as not required for plot:
rm(data)
# generate plot and send straight to png file:
png("plot1.png",width=480,height=480)
hist(subsetdata$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
rm(subsetdata)