source("C:\\workspace\\dataset1\\flatFailure.r",print.eval=TRUE)
source("C:\\workspace\\dataset1\\flatError.r",print.eval=TRUE)
errors <- zoo(errorframe)
failures <- zoo(failureframe)
telemetry <- read.table("machine_1_telemetry.csv",sep=",",header=FALSE)
names <- c("datetime","machineID","volt","rotate","pressure","vibration")
telemetryts <- zoo(telemetry)
colnames(telemetryts) <- names
