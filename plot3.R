#read the file
tabl<-read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings=c("?"),
                 colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                              "numeric","numeric","numeric"))

#Modifying Date format and altering Date Timestamp field 
tabl$Time <- strptime(paste(tabl$Date,tabl$Time), "%d/%m/%Y %H:%M:%S")
tabl$Date <- as.Date(tabl$Date,"%d/%m/%Y")

#Subset only the required dataset Date in ("2007-02-01" and "2007-02-02")
tabl_subset <- subset(tabl, tabl$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Initialize the png file
png("plot3.png",width=480,height=480)

#Plot the diagram
with(tabl_subset, 
     { plot(x=tabl_subset$Time, y = tabl_subset$Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
       lines(x=tabl_subset$Time, y = tabl_subset$Sub_metering_2, type="l", col = "red")
       lines(x=tabl_subset$Time, y = tabl_subset$Sub_metering_3, type="l", col = "blue")
       legend("topright", lty = "solid", col = c("black", "red", "blue"), 
              legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
     })


#Close the properties
dev.off()


