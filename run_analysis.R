if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip") ## download dataset

unzip(zipfile="./data/Dataset.zip",exdir="./data") ## unzip dataSet to /data directory

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt") ## read training tables

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt") ## read testing tables

features <- read.table('./data/UCI HAR Dataset/features.txt') ## read feature vector
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt') ## read activity labels

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')
## assign column names 

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
AllInOne <- rbind(mrg_train, mrg_test) ## merge all together

colNames <- colnames(setAllInOne)
mean_and_std <- (grepl("activityId" , colNames) | 
                     grepl("subjectId" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) 
)
ForMeanAndStd <- AllInOne[ , mean_and_std == TRUE] ## extract mean and st deviation for every measurement

WithActivityNames <- merge(ForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE) ## name the activities in the dataset

secTidySet <- aggregate(. ~subjectId + activityId, WithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),] 

write.table(secTidySet, "secTidySet.txt", row.name=FALSE) ## create and write a second independent 
## tidy data set with averages in each variable


