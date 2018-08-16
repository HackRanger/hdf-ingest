source("C:\\workspace\\dataset1\\flatFailure.r",print.eval=TRUE)
source("C:\\workspace\\dataset1\\flatError.r",print.eval=TRUE)
errors <- zoo(errorframe)
failures <- zoo(failureframe)
errfails <- merge.zoo(errors,failures)
telemetry <- read.table("machine_1_telemetry.csv",sep=",",header=FALSE)
names <- c("dates","machineID","volt","rotate","pressure","vibration")
telemetryts <- zoo(telemetry)
colnames(telemetryts) <- names
start <- as.POSIXlt("2015-07-01 00:00:00")
end   <- as.POSIXlt("2015-08-30 11:00:00")
dates <- seq(start, end, by=3600)
stamp <- start
newdata = c()
for(row in 1:nrow(telemetryts)){
    print(errfails[which(errfails$dates.failures==telemetryts[row]$dates)])
}


