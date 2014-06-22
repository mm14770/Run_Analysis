## CodeBook - tidy.mean.csv

### Variables

   * ID of the subject (30 subjects)
   * Activity label
        * Walking
        * Walking Upstairs
        * Walking Downstairs
        * Sitting
        * Standing
        * Laying
   * Mean and standard deviation of measurements from :
        * Accelerometer (units : g)
        * Gyroscope (units : radians/second)

### Getting and cleaning data

The data should be already downloaded in a local directory. The data for the project
is available at :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R does the following :

   * Get the data from local directory
   * Build a data set for the Activities
   * Build a data set for the Measurements
   * Build a data set for the Subjects
   * Merge data (Subjects, Activities and Measurements)
   * Extract only the measurements for the mean and standard deviation
   * Create an aggregate data set (mean)
   * Write output files

   * Additional package required : No

By merging the train and test data set, we get 10,299 rows and 563 variables (561
measurements, activity labels and subject identifier).

After extracting the mean and standard deviation of the measurements, the number of
variable is reduce to 68 (33 means of measurements, 33 standard deviations of
measurements, activity labels and subject identifier).

By aggregating by subject and activities, the final data set has 180 rows (30 subjects
and 6 activities) and 68 variables.

Two files is produce :
   * tidy.csv : Data set with only the mean and standard deviation for each measurement
                (10 299 rows by 563 variables).
   * tidy.mean.csv : Aggregate using mean for each activity and each subject
                     (180 rows by 68 variables).

### Experimental study design used

The description of the experimental study design is available at :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
