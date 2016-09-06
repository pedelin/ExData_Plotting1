plot1 <- function(){
        load_mydata <- function(file,dates){
                #Reading the file to "mydata"
                mydata_tmp<-fread(file,na.string="?",header = TRUE)
                # Subset data to correspond to interesting dates
                mydata <- subset(mydata_tmp,Date %in% dates)
                mydata <- data.frame(mydata)
                # Remove temp data
                rm(mydata_tmp)
                # Convert to date class
                mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
                # Convert to time class
                mydata$Time <- strptime(paste(mydata$Date, mydata$Time, sep=" "),  format="%Y-%m-%d %H:%M:%S")
                
                mydata
        }
        library(data.table)
        # Set up for getting the weekdays in english
        Sys.setlocale("LC_TIME", "English")
        # Data file, specify path if not in wd
        file <- "household_power_consumption.txt"
        # Dates of interest
        date1 <- "1/2/2007"
        date2 <- "2/2/2007"
        dates <- c(date1,date2)
        #Read data
        mydata<-load_mydata(file,dates)
        
        # Creates graphic device for plot

        # Creates graphic device for plot
        png("plot1.png",width = 480,height = 480)
        # Plot
        hist(mydata$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
        dev.off()
}