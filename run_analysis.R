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
fmean <- grep("mean\\(\\)", featuresName)
fstd  <- grep("std\\(\\)", featuresName)
fmad  <- grep("mad\\(\\)", featuresName)
#fmax  <- grep("max\\(\\)", featuresName)
#fmin  <- grep("min\\(\\)", featuresName)

#features <- c(fmean,fstd)
#features <- c(fmean,fstd, fmad, fmax, fmin)
features <- c(fmean,fstd, fmad)
rm(fmean,fstd) 
rm(fmad)
#rm(fmax, fmin)
rm(allFiles)

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
rm(activityLabels)

message(" - X...")
Xtrain <- read.table(trainFiles[11],header=FALSE)
message(" - X => Extracting mean() and std() features in Xtrain...")
Xtrain <- Xtrain[c(features)]
Xtest  <- read.table(testFiles[11],header=FALSE) 
message(" - X => Extracting mean() and std() features in Xtest...")
Xtest  <- Xtest[c(features)]
X      <- rbind(Xtrain, Xtest)
names(X) <- featuresName[c(features)]
rm(Xtrain)
rm(Xtest)
rm(featuresName)
rm(features)
rm(trainFiles); rm(testFiles);

message("Make tidy dataset...")
tidyset <- cbind(X,subject,y)
rm(X); rm(y); rm(subject);

message("Writing tidy dataset...")
tidypath="merged/tidy.csv"
write.csv(tidyset, file=tidypath, row.names=FALSE)
write.table(tidyset, file="merged/tidy.txt", sep="\t", row.names=FALSE)

message("checking tidy dataset...")
tidy <- read.csv(tidypath, header=TRUE)
d1 <- dim(tidyset)
d2 <- dim(tidy)
if(d1[1] != d2[1] | d1[2] != d2[2]) {
  stop("Error on tidy dataset. STOP.")
} else message("OK!")
  
rm(d1); rm(d2); rm(tidy); rm(tidypath)

###Part 5
#Creates a second, independent tidy data set 
#extract column information for 2° tidy set
message("Making average tidyset...")
activityLabel <- names(table(tidyset$Activity))
subjectMax <- length(names(table(tidyset$Subject))) #Range 1:subjectMax

message(" - Expected dimension:")
nRows <- length(activityLabel)*subjectMax
print(c(nRows, dim(tidyset)[2]))
#avgtidyset <- data.frame(NULL, sapply(tidyset,FUN=function(x){class(x)}))
#Raw Pre initialization
colNames <- names(tidyset)
avgtidyset <- tidyset[1:nRows,!colNames %in% ("Activity") & !colNames %in% ("Subject")]
names(avgtidyset) <- paste("avg",names(tidyset[-100:-101]),sep="")
avgtidyset <- cbind(Activity=activityLabel,Subject=0, avgtidyset)
rm(colNames);

num_rows <- 0                   #for checking don't miss a row.
k<-1                            # avgtidyset current Row

for (i in 1:subjectMax) {
  for( j in activityLabel) {
    subtidy <- subset(tidyset, Activity == j & Subject == i )
    nr <- dim(subtidy)[1]
    num_rows <- num_rows + nr
    #Averaging the subset features for the activity and Subject
    sub2 <- subset(subtidy, select=c(-Activity, -Subject)) #removing 2 constant column
    avgsubtidy <- colMeans(sub2)
    #NOTE: colMeans(sub2) == apply(sub2,2,FUN=mean)
    #avgsubtidy <- apply(subtidy,2,FUN=function(x){ if(is.numeric(x)) mean(x)})
    avgtidyset[k,] <- c(Activity=j, Subject=i, avgsubtidy)
    k <- k+1
    #avgtidyset[k] <- subtidy
    #dt <- data.frame(sapply(subtidy, FUN=function(x){
    #  if(is.numeric(x)) mean(x)
    #  else x
   # } ))
  }
}
rm(activityLabel)

rm(subtidy); rm(sub2); rm(avgsubtidy);
rm(i); rm(j); rm(nr)
#Check
if(num_rows != dim(tidyset)[1]) {
  message("All rows processed:")
  print(num_rows)
  stop("'For loops' error. Not all rows processed from tidyset. STOP!")
}
#Check
if(k-1 != nRows)
{
  print(c(k-1,nRows))
  stop("k != nRows. STOP!")
}

rm(num_rows)
rm(k); rm(nRows);

message("Writing mean tidy dataset...")
tidypath="merged/avgtidy.csv"
write.csv(avgtidyset, file=tidypath, row.names=FALSE)
write.table(avgtidyset, file="merged/avgtidy.txt", sep="\t", row.names=FALSE)

message("checking avgtidy.csv dataset...")
tidy <- read.csv(tidypath, header=TRUE)
d1 <- dim(avgtidyset)
d2 <- dim(tidy)
if(d1[1] != d2[1] | d1[2] != d2[2]) {
  stop("Error on tidy dataset. STOP.")
} else message("OK!")

rm(d1); rm(d2); rm(tidy); rm(tidypath)
 
