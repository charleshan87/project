
# Refer to the README markdown file for further code comments

# Read in data and merge

xtrain <- read.table("X_train.txt")
xtest <- read.table("X_test.txt")
xtot <- rbind(xtrain, xtest)

# Clean up feature vector variable names

feature <- read.table("features.txt")
f <- feature[,2]
index1 <- grep("mean()", f)
index2 <- grep("std()", f)
index3 <- c(index1, index2)
xclean <- xtot[, index3]
f1 <- f[index3]
f2 <- gsub("[^[:alnum:]]","", f1)
f3 <- gsub("Acc", "accelerometer", f2)
f4 <- gsub("Gyro", "gyrometer", f3)
f5 <- gsub("Mag","magnitude", f4)
f6 <- gsub("Freq", "frequency", f5)
f7 <- gsub("std", "standarddeviation", f6)
f8 <-vector('character')

for (i in 1:length(f7)) {
    if(substr(f7[i],1,1) == "t"){
        f8[i] <- sub(substr(f7[i],1,1),"time", f7[i])
    } 
    else if(substr(f7[i],1,1) == "f"){
        f8[i] <- sub(substr(f7[i],1,1),"frequency",f7[i])
    }
}

f9 <- tolower(f8)
colnames(xclean) <- f9

# Read in activity labels and clean up label names

ytrain <- read.table("y_train.txt")
for (i in 1:length(ytrain[,1])) {
	if(ytrain[i,1] == 1){
  		ytrain[i,1] = "walking"
	} else if(ytrain[i,1] == 2){
		ytrain[i,1] = "walkingupstairs"
	} else if(ytrain[i,1] == 3){
		ytrain[i,1] = "walkingdownstairs"
	} else if(ytrain[i,1] == 4){
		ytrain[i,1] = "sitting"
	} else if(ytrain[i,1] == 5){
		ytrain[i,1] = "standing"
	} else if(ytrain[i,1] == 6){
		ytrain[i,1] = "laying"
	} 
}

ytest <- read.table("y_test.txt")
for (i in 1:length(ytest[,1])) {
	if(ytest[i,1] == 1){
  		ytest[i,1] = "walking"
	} else if(ytest[i,1] == 2){
		ytest[i,1] = "walkingupstairs"
	} else if(ytest[i,1] == 3){
		ytest[i,1] = "walkingdownstairs"
	} else if(ytest[i,1] == 4){
		ytest[i,1] = "sitting"
	} else if(ytest[i,1] == 5){
		ytest[i,1] = "standing"
	} else if(ytest[i,1] == 6){
		ytest[i,1] = "laying"
	} 
}

ytot <- rbind(ytrain, ytest)
colnames(ytot) <- "activity"

# Combine activity labels with combined x data

tidy1 <- data.frame(ytot, xclean)

# Read in and combine subject IDs and combine with tidy1 from above

subj_train <- read.table("subject_train.txt")
subj_test <- read.table("subject_test.txt")
subjects <- rbind(subj_train, subj_test)
colnames(subjects) <- "subject"
tidy2 <- data.frame(subjects, tidy1)

# Load reshape2 package and melt and dcast data using the mean function

library(reshape2)
m <- melt(tidy2, id=c("subject", "activity"))
d <- dcast(m, subject + activity~variable, mean)

write.table(d, file = "tidydata.txt", append = FALSE, quote = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)

# End of File

