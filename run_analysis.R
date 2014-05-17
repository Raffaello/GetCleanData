#############
#run_analysis
#############

rm(list=ls())

source("getData.R")

#get all files from datasets
allFiles <- list.files("UCI HAR Dataset", recursive=TRUE, all.files=TRUE, full.names=TRUE)

#gets only the files to working on
trainFiles <- allFiles[grep("/train/", allFiles)]
testFiles <- allFiles[grep("/test/", allFiles)]
#allFiles <- allFiles[grep("/train/|/test/", allFiles)]

#Check
if(length(trainFiles) != length(testFiles)){
  stop("Error on Dataset. Exit!")
}

message("Reading Activity labels...")
allFiles[grep("activity_labels.txt$",allFiles)]
activityLabels <- read.table(allFiles[grep("activity_labels.txt$",allFiles)], header=F, stringsAsFactors=FALSE)
activityLabels <- activityLabels[,"V2"]
activityLabels <- gsub("_",".",tolower(activityLabels))
#activityLabels <- gsub("(^[a-z]{1})","\\U\\1",activityLabels,perl=TRUE)
#activityLabels <- gsub("(\\.[a-z]{1})","\\U\\1",activityLabels, perl=TRUE)

message("Reading Features name...")
featuresName <- simplify2array(read.table(allFiles[grep("features.txt$",allFiles)],header=F, stringsAsFactors=FALSE)$V2)
featuresName <- gsub("(-[xyz]{1}$)","\\U\\1",tolower(featuresName),perl=TRUE)
fmean <- grep("mean", featuresName)
fstd  <- grep("std", featuresName)
features <- c(fmean,fstd)
rm(fmean,fstd)
rm(allFiles)

#avgFeaturesName
#avgFeatures = round(length(featuresName)/3)
#check
#if(avgFeatures*3 != length(featuresName)) {
#  stop("Error in dataset.")
#}

#nameFiles <- strsplit(trainFiles,'/')
#nameFiles <- sapply(nameFiles, FUN=function(x){tail(x,1)})
#nameFiles <- simplify2array(strsplit(nameFiles,"_train.txt$"))

#Check number of nameFiles...
#if(length(trainFiles) != length(nameFiles)) {
# stop("Error on Dataset. Exit!")
#}

#numFiles = length(trainFiles)

#Create subdir to store merged results
if(!file.exists("./merged"))
{
  message("Creating dir ('merged') to store tidy dataset.")
  dir.create("./merged")
}


message("Merging dataset...")
message(" - Subjects...")
subjectTrain <- read.table(trainFiles[10],header=F, stringsAsFactors=FALSE)
subjectTest  <- read.table(testFiles[10],header=F, stringsAsFactors=FALSE)
subject <- rbind(subjectTrain, subjectTest)
rm(subjectTrain)
rm(subjectTest)
names(subject) <- "Subject"

message(" - y...")
ytrain <- read.table(trainFiles[12],header=FALSE)
ytest  <- read.table(testFiles[12],header=FALSE)
y      <- rbind(ytrain, ytest)
rm(ytrain)
rm(ytest)
y <- simplify2array(y)
y <- data.frame(activityLabels[y])
names(y) <- "Activity"

message(" - X...")
Xtrain <- read.table(trainFiles[11],header=FALSE)
message(" - X => Extracting mean() and std() feacture in Xtrain...")
Xtrain <- Xtrain[c(features)]
Xtest  <- read.table(testFiles[11],header=FALSE) 
message(" - X => Extracting mean() and std() feacture in Xtest...")
Xtest  <- Xtest[c(features)]
X      <- rbind(Xtrain, Xtest)
names(X) <- featuresName[c(features)]
rm(Xtrain)
rm(Xtest)
rm(featuresName)
rm(features)
rm(trainFiles); rm(testFiles);

message("Make tidy dataset...")
table <- cbind(X,subject,y)
rm(X); rm(y); rm(subject);

message("Writing tidy dataset...")
tidypath="merged/tidy.csv"
write.csv(table, file=tidypath, row.names=FALSE)

message("checking tidy dataset...")
tidy <- read.csv(tidypath, header=TRUE)
d1 <- dim(table)
d2 <- dim(tidy)
if(d1[1] != d2[1] | d1[2] != d2[2]) {
  stop("Error on tidy dataset. STOP.")
} else message("OK!")
  
rm(d1); rm(d2); rm(tidy);

###Part 5
#Creates a second, independent tidy data set 
#with the average of 
#each variable for each activity 
#and each subject. 


#means <- sapply(X, FUN=function(x){mean(x, na.rm=TRUE)})
#names(means) <- NULL
#stds  <- sapply(X, FUN=function(x){sd(x, na.rm=TRUE)})
#names(stds) <- NULL
#X <- data.frame(cbind(means,stds))
#names(X) <- c("Mean", "Std")


