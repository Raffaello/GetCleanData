GetCleanData
============

Getting &amp; Cleaning Data Project (coursera assigment.)

##Files Included
- `getData.R` => "side-script" to download and unzip the data-set required in `run_analysis.R`.
- `run_analysis.R` => Main script. It call `getData.R`.

##Description

- This script build a tidy dataset from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "getdata-projectfiles-UCI HAR Dataset.zip")
- The tidy dataset as extracted from the following dataset composition diagram: ![Slide2.png](https://raw.githubusercontent.com/Raffaello/GetCleanData/master/doc/Slide2.png)

##Tidy Data

NOTE: The required result is store in the `avgtidy.csv` file.

###Large dataset 
 
The data are merged in one big files (`merged/tidy.csv`) with header. The features extracted are with the following function used:

- `mean()`: mean.
- `std()` : standard deviation.
- `mad()` : median average deviation.

Every function is normalized in the range [-1,1] for the respective axis X, Y, Z.
These features are used for tidy data and they were chosen for summarize better the entire dataset. 

Almost of all others features are not carrying some general useful information, but specific one. Moreover some of the features can be derivated from this tidy data.  

The full dataset is composed by 561 features plus 2 more columns for label class Activity and Subject. 
The resultant build dataset is composed by 99 + 2.

#### Composition

From the dataset are extracted all the features containing the words `means()`, `std()` and `mad()` using regular expression. All others are discarded.

### Tidy dataset

From the large dataset, the data is aggregate by the value of each activity and of each subject, averaging every single features. The results are expressed in the figure below:
![avgtidytable](https://raw.githubusercontent.com/Raffaello/GetCleanData/master/doc/avgtidytable.png) 

## Script Steps
1. Check if the data-set is present in the working directory. If no it download and unzip (If you have problem with downloaded data download it manually from the link above, and extract it in the working directory).
2. Performs some checks on the data-set files.
3. Read Activity Labels
4. Read Features and extract columns of interest.
5. creating the *merged* subdirectory to store result if not present.
6. Read & Merge subject for train and test set.
7. Read & Merge y for train and Test set and replace the class number with the relative Name. Assign Label "Activity" 
8. Read, Subset & Merge X for train and test set and assign relative Feature Name.
9. Make table as shown in above diagram.
10. Write table to CSV file.
11. Make the (avg) tidy dataset (`avgtidy.csv`) which for each Activity and for each Subject aggregate the means of the relative features of the previous builded dataset.

## Usage

Clone the repository.

	git clone https://github.com/Raffaello/GetCleanData.git

(*Optional*) Unzip the dataset inside the working directory.

Run the `run_analysis.R` with R or RStudio.



## Results

The results are in the subdir `merged`. There is one version in `CSV` and one with `TAB` delimiter for both dataset.     