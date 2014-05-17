GetCleanData
============

Getting &amp; Cleaning Data Project (coursera assigment.)

#Files Included
- `getData.R` => "side-script" to download and unzip the data-set required in `run_analysis.R`.
- `run_analysis.R` => Main script. It call `getData.R`.

#Description

- This script build a tidy dataset from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "getdata-projectfiles-UCI HAR Dataset.zip")
- The tidy dataset as the following diagram: ![Slide2.png](https://raw.githubusercontent.com/Raffaello/GetCleanData/master/doc/Slide2.png)

#Tidy Data

The data are merged in one big files (`merged/tidy.csv`) with header. The features extracted are with the `mean` or `std` function present. It relies on the pattern matching where the word `mean` or `std` is present. 

# Script Steps
1. Check if the data-set is present in the working directory. If no it download and unzip (If you have problem with downloaded data download it manually from the link above, and extract it in the working directory).
2. Performs some checks on the data-set files.
3. Read Activity Labels
4. Read Features and extract columns where 'mean' or 'std' function was used.
5. creating the 'merged' where store result if not present.
6. Read & Merge subject for train and test set.
7. Read & Merge y for train and Test set and replace the class number with the relative Name. Assign Label "Activity" 
8. Read, Subset & Merge X for train and test set and assign relative Feature Name.
9. Make table as shown in above diagram.
10. Write table to CSV file.

# Usage

Clone the repository.

	git clone https://github.com/Raffaello/GetCleanData.git

(*Optional*) Unzip the dataset inside the working directory.

Run the `run_analysis.R` with R or RStudio.



# Results

The results are in the subdir `merged`
	    
    
    