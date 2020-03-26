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
png("plot2.png",width=480,height=480)

#Plot the diagram
plot(tabl_subset$Time,tabl_subset$Global_active_power,type="l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)"
)

#Close the properties
dev.off()

