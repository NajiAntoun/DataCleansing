# CodeBook

## Data Sources

### Data Set information
Human Activity Recognition Using Smartphones Dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Location
* UCI website : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Files description
* 'README.txt' : Information about the data set

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

**Notes:**
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Data Transformation
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Transformations done :

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Tidy Set File

### File Description
the tidy set is an average-based aggregation by activity and subject of all mean and standard deviation measures available in the test and train source data set.

* **Filename** : _TidyData.txt_
* **Header** : _yes_
* **Format** : _text file_
* **Location** : _R working directory_

### File Content
* **observations** : 40
* **variables** : 68 

### File Structure
* **Factors**
    * activity
    * subject
* **Measures (averages)**
* time-body-accelerometer-mean-x
* time-body-accelerometer-mean-y
* time-body-accelerometer-mean-z 
* time-body-accelerometer-std-x
* time-body-accelerometer-std-y
* time-body-accelerometer-std-z 
* time-gravity-accelerometer-mean-x
* time-gravity-accelerometer-mean-y
* time-gravity-accelerometer-mean-z
* time-gravity-accelerometer-std-x
* time-gravity-accelerometer-std-y
* time-gravity-accelerometer-std-z
* time-body-accelerometer-jerk-mean-x
* time-body-accelerometer-jerk-mean-y
* time-body-accelerometer-jerk-mean-z
* time-body-accelerometer-jerk-std-x
* time-body-accelerometer-jerk-std-y
* time-body-accelerometer-jerk-std-z
* time-body-gyroscope-mean-x 
* time-body-gyroscope-mean-y 
* time-body-gyroscope-mean-z
* time-body-gyroscope-std-x
* time-body-gyroscope-std-y
* time-body-gyroscope-std-z 
* time-body-gyroscope-jerk-mean-x
* time-body-gyroscope-jerk-mean-y
* time-body-gyroscope-jerk-mean-z 
* time-body-gyroscope-jerk-std-x 
* time-body-gyroscope-jerk-std-y 
* time-body-gyroscope-jerk-std-z 
* time-body-accelerometer-magnitude-mean
* time-body-accelerometer-magnitude-std
* time-gravity-accelerometer-magnitude-mean
* time-gravity-accelerometer-magnitude-std
* time-body-accelerometer-jerk-magnitude-mean
* time-body-accelerometer-jerk-magnitude-std 
* time-body-gyroscope-magnitude-mean
* * time-body-gyroscope-magnitude-std
* time-body-gyroscope-jerk-magnitude-mean
* time-body-gyroscope-jerk-magnitude-std
* frequency-body-accelerometer-mean-x
* frequency-body-accelerometer-mean-y
* frequency-body-accelerometer-mean-z 
* frequency-body-accelerometer-std-x
* frequency-body-accelerometer-std-y
* frequency-body-accelerometer-std-z
* frequency-body-accelerometer-jerk-mean-x 
* frequency-body-accelerometer-jerk-mean-y 
* frequency-body-accelerometer-jerk-mean-z
* frequency-body-accelerometer-jerk-std-x
* frequency-body-accelerometer-jerk-std-y
* frequency-body-accelerometer-jerk-std-z
* frequency-body-gyroscope-mean-x
* frequency-body-gyroscope-mean-y 
* frequency-body-gyroscope-mean-z 
* frequency-body-gyroscope-std-x 
* frequency-body-gyroscope-std-y 
* frequency-body-gyroscope-std-z
* frequency-body-accelerometer-magnitude-mean
* frequency-body-accelerometer-magnitude-std 
* frequency-body-accelerometer-jerk-magnitude-mean
* frequency-body-accelerometer-jerk-magnitude-std 
* frequency-body-gyroscope-magnitude-mean
* frequency-body-gyroscope-magnitude-std
* frequency-body-gyroscope-jerk-magnitude-mean
* frequency-body-gyroscope-jerk-magnitude-std 


## R Script description

### Script name
run_analysis.R

### Pre-requesites
the script uses the following libraries which should be installed as a pre-requesite: 
* data.table
* dplyr

### Usage
1. unzip the *getdata-projectfiles-UCI HAR Dataset.zip* zip file in your R working directory
2. make sure that all the pre-requesites stated in the previous chapter are met
3. execute the run_analysis.R script
