library(reshape2)

## Download and unzip the dataset :
## 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileURL, "getdata_projectfiles_Dataset.zip", method ="curl")
unzip("getdata_projectfiles_Dataset.zip")

# Load Activity Labels
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
ActivityLabels[,2] <- as.character(ActivityLabels[,2])

# Extract Selected Features 
##
AllFeatures <- read.table("UCI HAR Dataset/features.txt")
AllFeatures[,2] <- as.character(AllFeatures[,2])
SelectedFeatures <- grep(".*mean*|.*std.*", AllFeatures[,2])
SelectedFeatureNames <- AllFeatures[SelectedFeatures,2]
SelectedFeatureNames <- gsub('-mean','Mean',SelectedFeatureNames)
SelectedFeatureNames <- gsub('-std','Std',SelectedFeatureNames)
SelectedFeatureNames <- gsub('[-()]','',SelectedFeatureNames)

# Load training dataset and label
#
print("Loading Training Set....")
TrainSet <- read.table("UCI HAR Dataset/train/X_train.txt")[SelectedFeatures]
TrainActSet <- read.table("UCI HAR Dataset/train/Y_train.txt")
TrainSubjectSet <- read.table("UCI HAR Dataset/train/subject_train.txt")
TrainSet <- cbind(TrainSubjectSet,TrainActSet, TrainSet)

# Load testing dataset and label
#
print("Loading Test Set....")
TestSet <- read.table("UCI HAR Dataset/test/X_test.txt")[SelectedFeatures]
TestActSet <- read.table("UCI HAR Dataset/test/Y_test.txt")
TestSubjectSet <- read.table("UCI HAR Dataset/test/subject_test.txt")
TestSet <- cbind(TestSubjectSet,TestActSet, TestSet)

# Merge Training Set and Test Set
#
print("Merging Dataset.....")
FullSet <- rbind(TrainSet,TestSet)
colnames(FullSet) <- c("subject", "activity", SelectedFeatureNames)

#Prepare Tidy Data
#
FullSet$activity <- factor(FullSet$activity, levels = ActivityLabels[,1], labels = ActivityLabels[,2])
FullSet$subject <- as.factor(FullSet$subject)

MeltedSet <- melt(FullSet, id = c("subject", "activity"))
MeltedMean <- dcast(MeltedSet, subject + activity ~ variable, mean)

#Write Tidy Data
print("Writing Tidy Data - tidy.txt")
write.table(MeltedMean, "tidy.txt", row.names = FALSE, quote = FALSE)

