#source("C:\\workspace\\dataset1\\flatFailure.r",print.eval=TRUE)
#source("C:\\workspace\\dataset1\\flatError.r",print.eval=TRUE)
source("flatError.r",print.eval=TRUE)
source("flatFailure.r",print.eval=TRUE)
errors <- zoo(errorframe)
failures <- zoo(failureframe)
errfails <- merge.zoo(errors,failures)
telemetry <- read.table("machine_1_telemetry.csv",sep=",",header=FALSE)
names <- c("dates","machineID","volt","rotate","pressure","vibration")
telemetryts <- zoo(telemetry)
colnames(telemetryts) <- names
fulldata <- merge.zoo(telemetryts,errfails)
fulldata$machineID <- as.numeric(fulldata$machineID)
fulldata$volt <- as.numeric(fulldata$volt)
fulldata$rotate <- as.numeric(fulldata$rotate)
fulldata$pressure <- as.numeric(fulldata$pressure)
fulldata$vibration <- as.numeric(fulldata$vibration) 
fulldata$type1s <- as.numeric(fulldata$type1s) 
fulldata$type2s <- as.numeric(fulldata$type2s)
fulldata$type3s <- as.numeric(fulldata$type3s)
fulldata$type4s <- as.numeric(fulldata$type4s) 
fulldata$type5s <- as.numeric(fulldata$type5s)
fulldata$comp1s <- as.numeric(fulldata$comp1s)  
fulldata$comp2s <- as.numeric(fulldata$comp2s)  
fulldata$comp3s <- as.numeric(fulldata$comp3s)  
fulldata$comp4s <- as.numeric(fulldata$comp4s)   
write.csv(fulldata, file = "newtelemetry.csv")
