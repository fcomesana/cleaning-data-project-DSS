# Code Book

### Data proccessing

The script run_analysis.R performs the next transformations:
1. All the data included in different data sets is proccessed in only one data set.
2. The identifactor of the activities is substituted with the name of the activity in `features.txt`.
3. The columns with vague column names are corrected.
4. The script only consider the variables that indicates average measures or standard desviations for each observation.
5. The script generates a new data set with all the average measures and the standard desviations of each subject and activity type. The output file is called `activity_tidy_data.txt`, and uploaded to this repository.


### Variables

In this appart I will descrive the final variables you will find in the `activity_tidy_data.txt` file.

* `subject` is de id number of the subject of the observation
* `activity` is the activity the subject was doing when the sensors captured the movement
* `tBodyAcc-mean()-X` to `fBodyBodyGyroJerkMag-std()` are de average of the observations in the original data set, correspondig to the mean and standard desviation of the train and test subjects. 
