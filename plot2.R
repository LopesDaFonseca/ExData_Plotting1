# Get/Read the data
# Set the Working Directory as the exdata-data-household_power_consumption folder
# 'directory' is a character vector indicating the location of the Electric Power Consumption file 
# copy the path for the exdata-data-household_power_consumption folder and replace the current path inside the parentheses in the following line

directory<-setwd("D:/Courses/Coursera/3 Data Science - JohnHopkinsU/4 Exploratory Data Analysis/Project Assignments/1/exdata-data-household_power_consumption")

EPC.data<-read.csv2(paste(directory,"/","household_power_consumption.txt", sep=""),quote="\"", header=TRUE, na.strings="?")

# Prepara data to subset 2 days in February
EPC.data$Date <- as.Date(EPC.data$Date, "%d/%m/%Y")

EPC<-subset(EPC.data, Date=="2007-02-01" | Date=="2007-02-02")


#Change data formats appropriately
EPC$DateTime<-paste(EPC$Date,EPC$Time)
EPC$DateTime<-strptime(EPC$DateTime, "%Y-%m-%d %T")

EPC$Global_active_power<-as.numeric(as.character(EPC$Global_active_power))
EPC$Global_reactive_power<-as.numeric(as.character(EPC$Global_reactive_power))
EPC$Voltage<-as.numeric(as.character(EPC$Voltage))
EPC$Global_intensity<-as.numeric(as.character(EPC$Global_intensity))
EPC$Sub_metering_1<-as.numeric(as.character(EPC$Sub_metering_1))
EPC$Sub_metering_2<-as.numeric(as.character(EPC$Sub_metering_2))
EPC$Sub_metering_3<-as.numeric(as.character(EPC$Sub_metering_3))

#Tidy dataframe and workspace

row.names(EPC) <- NULL
EPC.tidy<-EPC[,3:10]
rm(EPC.data)
rm(EPC)

##########################
#Plot Global Active Power#
##########################

# Change locale from my local to North America so weekdays are in English
Sys.setlocale("LC_TIME", "C")

#RStudioGD()
png(file="plot2.png",width = 480, height = 480, units = "px")
plot(y=EPC.tidy$Global_active_power, x=EPC.tidy$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px")
dev.off()





