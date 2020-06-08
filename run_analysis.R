#checks if directory exists; if not, creates directory
if(!file.exists("./SamsungData")){dir.create("./SamsungData")}

#downloads files (Comment to links w more info)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./SamsungData/Dataset.zip", method = "auto")

#opens files and loads them
train <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/train/X_train.txt"))
test <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/test/X_test.txt"))
act_train <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/train/y_train.txt"), col.names = c("activity"))
act_test <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/test/y_test.txt"), col.names = c("activity"))
subj_train <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/train/subject_train.txt"), col.names = c("subject"))
subj_test <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/test/subject_test.txt"), col.names = c("subject"))
variables <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/features.txt"))
activities <- read.table(unz("./SamsungData/Dataset.zip","UCI HAR Dataset/activity_labels.txt"))

#gives train and test sets appropriate variable names
names(train) <- variables[,2]
names(test) <- variables[,2]

#adds subject to train and test
train <- data.frame(subj_train, act_train, train)
test <- data.frame(subj_test, act_test, test)

#merges the sets
fullDataset <- merge(train, test, all = TRUE)

#rename activities with descriptive names
for (j in 1:10299) {
        for (i in activities[,1]){        
                if (i == fullDataset[j,2]){
                        fullDataset[j,2] <- tolower(as.character(activities[i,2]))
                }
        }
}

#Extracts only the measurements on the mean and standard deviation for each measurement.
stdColumns <- grep("std",names(fullDataset))
meanColumns <- grep("mean",names(fullDataset))
meanFreqColumns <- grep("meanFreq",names(fullDataset))
meanColumns <- setdiff(meanColumns, meanFreqColumns)
relevantColumns <- sort(c(1,2,stdColumns,meanColumns))
filteredSet <- fullDataset[,relevantColumns]

#rename columns
for (i in 3:68){
        newname <- ""
        if (grepl("mean", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "average of", sep=" ")
        }
        if (grepl("std", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "standard deviation of", sep=" ")
        }
        if (grepl("Body", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "body", sep=" ")
        }
        if (grepl("Gravity", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "gravity", sep=" ")
        }
        if (grepl("Acc", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "accelerometer", sep=" ")
        }
        if (grepl("Gyro", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "gyroscope", sep=" ")
        }
        if (grepl("Jerk", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "jerk", sep=" ")
        }
        if (grepl("Mag", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "magnitude", sep=" ")
        }
        if (grepl("^t", names(filteredSet)[i])){
                newname <- paste(newname, "time", sep=" ")
        }
        if (grepl("^f", names(filteredSet)[i])){
                newname <- paste(newname, "frequency", sep=" ")
        }
        if (grepl("...X", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "in x", sep=" ")
        } else if (grepl("...Y", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "in y", sep=" ")
        } else if (grepl("...Z", names(filteredSet)[i], fixed = TRUE)){
                newname <- paste(newname, "in z", sep=" ")
        }
        names(filteredSet)[i] <- newname
}

write.table(filteredSet,"./SamsungData/tidy.txt", row.names = FALSE)

#creates a second, independent tidy data set with the average of each variable for 
#each activity and each subject.

tidyAverages <- data.frame()
row=0

for (i in 1:30){
        for (j in activities[,2]){
                row=row+1
                calculationSet <- filteredSet[which(filteredSet$subject == i),]
                calculationSet2 <- calculationSet[which(calculationSet$activity == tolower(j)),]
                tidyAverages[row,1] <- i
                tidyAverages[row,2] <- tolower(j)
                for(k in 3:68){
                        tidyAverages[row,k] <- mean(calculationSet2[,k], na.rm = T)
                }
        }
} 

names(tidyAverages) <- names(filteredSet)
write.table(tidyAverages,"./SamsungData/tidyAverages.txt", row.names = FALSE)