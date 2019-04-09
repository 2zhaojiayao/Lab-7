#Plot1.R
#set working directory
setwd("D:/ForRExercise/")

#load library data.table
library(data.table)
DT <- fread("./household_power_consumption.txt",na.strings="?")

#set date as d/m/y
DT$strDate <- as.Date(DT$Date,"%d/%m/%y")
print(DT$strDate)

#select data
DT.filter <- DT[DT$strDate=="2007-02-01" | DT$strDate=="2007-02-02",]
DT.filter$Global_active_power <- as.numeric(DT.filter$Global_active_power)
#rm() is for remove variable
rm(DT)

#output histogram to PNG
png(filename="plot1.png",width=480,height=480)
hist(DT.filter$Global_active_power,
     col="red",
     xlab="Global Active Power(kilowatts)",
     main="Global Active Power")
dev.off()

#Plot2.R
#set working directory
setwd("D:/ForRExercise")

library(data.table)

#Geting full dataset
DT <- fread("./household_power_consumption.txt",na.strings="?")

DT$Date <- as.Date(DT$Date,format="%d/%m/%y")

#subsetting the data
DT.filter <- subset(DT,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(DT)

#coverting datas
datetime <- paste(as.Date(DT.filter$Date),DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#output histogram to PNG
plot(DT.filter$Global_active_power~DT.filter$Datetime,type="|",
     ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()