#Download Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./Quiz01.zip")

#Read Data
unzip("./Quiz01.zip")
Q01<-read.csv2("./household_power_consumption.txt", stringsAsFactors=FALSE, na.strings="?")

#Clean Data
rm(Q02)
Q02<-Q01
Q02$DateTime <- paste(Q02$Date, Q02$Time, sep =" ") 
Q02$DateTime<-strptime(Q02$DateTime, "%d/%m/%Y %H:%M:%S")
Q02$Global_active_power<-as.numeric(Q02$Global_active_power)
Q02$Global_reactive_power<-as.numeric(Q02$Global_reactive_power)
Q02$Voltage<-as.numeric(Q02$Voltage)
Q02$Global_intensity<-as.numeric(Q02$Global_intensity)
Q02$Sub_metering_1<-as.numeric(Q02$Sub_metering_1)
Q02$Sub_metering_2<-as.numeric(Q02$Sub_metering_2)
Q02$Sub_metering_3<-as.numeric(Q02$Sub_metering_3)

#Subsetting
Q03 <- subset(Q02, (Q02$DateTime>=as.POSIXlt("01/02/2007 00:00:00", format("%d/%m/%Y %H:%M:%S"), tz="")) & (Q02$DateTime<as.POSIXlt("03/02/2007 00:00:00", format("%d/%m/%Y %H:%M:%S"), tz="")))


#Plotting Plot 1
png("plot1.png", width=480, height=480)
hist(Q03$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col ="Red")
dev.off()

