read_analysis <- function() {

  ## load libraries
  
  library(dplyr)
  
  ## 0. load all the data in the main directory
  
  xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
  xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
  yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
  yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
  subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
  subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
  features <- read.table("UCI HAR Dataset/features.txt")
  activities <- read.table("UCI HAR Dataset/activity_labels.txt")
    
  ## 1. Merges the training and the test sets to create one data set.
  Train <- cbind(subjectTrain, xTrain, yTrain)
  Test <- cbind(subjectTest, xTest, yTest)
  base <- rbind(Train, Test)
  
  ## 3. Uses descriptive activity names to name the activities in the data set
  x <- left_join(base[563], activities)
  base[563] <- x[2]
  
  ## 4. Appropriately labels the data set with descriptive variable names. 
  variables <- c("subject", as.vector(features[[2]]), "activity")
  names(base) <- variables
  
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  mean <- grep("-mean", names(base), value = TRUE)
  std <- grep("-std", names(base), value = TRUE)
  base2 <- base[,c("subject", "activity", mean, std)]
  
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  final <- base2 %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))
  
  ## Write tidy final data set
  write.table(final, "activity_tidy_data.txt", row.name = FALSE)

}