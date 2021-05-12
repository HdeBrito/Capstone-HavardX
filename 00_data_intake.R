#%%%%%%%%%%%%%%%% DATA DOWNLOAD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%% Dowloading the files from repository %%%%%%%%%%%%%
#%%%%%%%%%%%%%%%% Red wine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"

# Set file destination
destfile <-"C:/Users/guedeshe/Documents/R Projects/Module_9_2/winequality-red.csv"

# Download file
download.file(url, destfile)

#%%%%%%%%%%%%%%% READ CSV Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

red_wine <- read.csv("C:\\Users\\guedeshe\\Documents\\R Projects\\Module_9_2\\winequality-red.csv",
                     header=TRUE,stringsAsFactors=FALSE,sep=";")
save(red_wine,file="red_wine.RData")

#%%%%%%%%%%%%%%% White wine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"
# Set file destination
destfile <-"C:/Users/guedeshe/Documents/R Projects/Module_9_2/winequality-white.csv"
# Download file
download.file(url, destfile)

# Remove temporary files from Global environment
rm(destfile,url)

#%%%%%%%%%%%%%%% READ CSV Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

white_wine <- read.csv("C:\\Users\\guedeshe\\Documents\\R Projects\\Module_9_2\\winequality-white.csv",
                       header=TRUE,stringsAsFactors=FALSE,sep=";")
save(white_wine,file="white_wine.RData")


#%%%%%%%%%%%% COMBINED DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# The red and white data are combined in a single dataset

red_wine$wine_type <- rep("red_wine",nrow(red_wine))
white_wine$wine_type <-rep("white_wine", nrow(white_wine))

# Are the variables in the red and white wine identical?
identical(names(red_wine),names(white_wine))
cbind(names(red_wine), names(white_wine))

# Combine data sets
wine <- rbind(red_wine,white_wine)
wine$wine_type <-as.factor(wine$wine_type)
save(wine,file="wine.RData")
