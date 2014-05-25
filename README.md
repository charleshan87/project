Final Course Project 
========================================================

Coursera Course: Getting and Cleaning Data  
Due Date: Sunday May 25, 2014  
by Charles Han  
https://github.com/charleshan87/project  


The generation of a tidy data set in this project utilizes collated data from a public repository at the following web address:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

All of the raw and collated data along with a code book describing the variables used in the study are contained in the following zipped data packet:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original study collected activities data on 30 human subjects 
(in the age bracket of 19-48 years old)on pre-installed accelerometers 
and gyroscopes on Samsung Galaxy S2 phones. In the study, linear 
acceleration and angular velocity was captured in the x, y, and z-axis,
at the collection rate of 50Hz. While the original study had the 
experimental goal of comparing 2 sets of subjects (70% of which were used as the training set), the class project here simply aims to examine the categorical means from a combined set of these 2 groups.

Each subject was recorded performing the following six activities:

1) walking   
2) walking upstairs     
3) walking downstairs    
4) standing   
5) sitting   
6) laying  

The validity of test design in terms of proper randomization, nor the evaluation of the efficacy of experimental methods are not the focus of this project. Also, evaluation of the appropriateness of any normalization performed on the raw data is not considered.
 
Our primary aim is collect (get) and format (clean) the data to be suitable for statistical mean calculations and present the tidy data set that conforms to R coding conventions as discussed in the lectures. The results of the following steps were written to a text fomat file, called 'tidydata.txt'. 

Training and test X data sets with all 561 features,  'X_train.txt' and 'X_test.txt', were read into R. It is assumed that these files appear in the same directory as where the script file, 'run_analysis.R' is launched. The 2 data frames are merged, placing the training group observations preceding the test group ones. The combined data set is saved as 'xtot'. This is step #1 in the instructions.


```{r}
xtrain <- read.table("X_train.txt")
xtest <- read.table("X_test.txt")
xtot <- rbind(xtrain, xtest)
```

The file that contains the feature vector variable names are read into R. When this file is read in, it is a 2 x 561 data frame consisting of an ordinal number column and sequence of names. 

First, any name that contains the string 'mean()' is extracted as a vector containing their column number index using the 'grep' function. Second, this procedure is repeated for any name that contains the string, 'std()'. These 2 vectors are combined as a single vector, 'index3'. Since this is a vector of integers and thus naturally placed in ascending order, it is used to extract the columns of data from the combined data set above, using the vector as the column indexes. This is step #2 in the instructions. 

```{r}
feature <- read.table("features.txt")
f <- feature[,2]
index1 <- grep("mean()", f)
index2 <- grep("std()", f)
index3 <- c(index1, index2)
xclean <- xtot[, index3]
```

The feature vector variables are then given descriptive names following the good practices R coding conventions as discussed in the lectures.First, all non alphanumeric characters like parenthesis, underscore, hyphen, and period are substituted with an empty space character, effectively removing them. Next, all abbreviated words are substituted with their full length counterpart. Then, an empty vector, 'f8' is created to capture the substitution of the 't' or 'f' characters that precedes each name to their full length word versions, time and frequency. A loop was required to initially check each name to see whether it starts with either 't' or 'f'. Also, it is used to index the location the first character so that this substitution will only occur once, as some of the names contain 't' or and 'f' in other locations after the first character position. As each name is processed, the results are filled into the created empty vector, 'f8'. Lastly, all characters in the names are changed to the lower case. This is step #3 in the instructions.

```{r}
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
```

This step is a reverse coding process to recover the activity names, which had been coded into numbers from 1 through 6. The procedure is repeated for the training and the test sets. They are then merged as a single data frame similar to the procedure above for the x data. In the process, the activity names are edited to the good practices R coding conventions for variable names which are also descriptive. This is step #4 in the instructions.

The extracted data with edited column names are merged with their activity labels. The activity labels are attached as the first column to the left of the combined data set, 'xtot'. 

```{r}
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
tidy1 <- data.frame(ytot, xclean)
```

The files containing the subject lables are read into R and merged similar to the procedures above using 'rbind' function. It is then merged as a new column to the left of 'tidy1' above similar to the procedure that merged the activites labels to the x data. This combined data set is 'tidy2'. 

```{r}
subj_train <- read.table("subject_train.txt")
subj_test <- read.table("subject_test.txt")
subjects <- rbind(subj_train, subj_test)
colnames(subjects) <- "subject"
tidy2 <- data.frame(subjects, tidy1)
```

The package 'reshape2' was installed in order to easily melt and cast the data by 'subject' and 'activity' applying the 'mean' function to reshape the data.

```{r}
library(reshape2)
m <- melt(tidy2, id=c("subject", "activity"))
d <- dcast(m, subject + activity~variable, mean)
```

The result of reshaping and applying the 'mean' function is written into text file format to 'tidydata.txt', creating the new tidy data set. This is step #5 in the instructions.

```{r}
write.table(d, file = "tidydata.txt", append = FALSE, quote = FALSE, sep = " ", row.names = TRUE, col.names = TRUE)
```

End of File
