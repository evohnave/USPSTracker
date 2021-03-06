getTrackedIDs <- function(all = FALSE){
    IDs <- read.csv(file = "packages.csv",
                    header = TRUE, 
                    stringsAsFactors = FALSE,
                    quote = "\"",
                    colClasses = c("character", "character", "logical"))
    return(IDs[IDs$Received <= all, 1])
}

trackMyPackages <- function(){

    trackIDs <- getTrackedIDs()

    if(length(trackIDs) == 0) {stop("Nothing To Track", call. = FALSE)}
    source(file = "trackPackage.R")
    WhereAreThey <- as.data.frame(lapply(X = trackIDs, FUN = trackPackage),
                                  stringsAsFactors = FALSE)
    names(WhereAreThey) <- paste("Package", 1:length(WhereAreThey), sep = " ")
    return(WhereAreThey)
}

addToCSV <- function(ID, Desc, Rcvd = FALSE){
    IDs <- read.csv(file = "packages.csv", header = TRUE, 
                    stringsAsFactors = FALSE, quote = "\"",
                    colClasses = c("character","character","logical"))
    newLine <- dim(IDs)[1] + 1
    IDs[newLine, 1] <- ID
    IDs[newLine, 2] <- Desc
    IDs[newLine, 3] <- Rcvd
    write.csv(x = IDs, file = "packages.csv", row.names = FALSE)
}

updateCSV <- function(ID, Desc = "existing", Rcvd = FALSE){
    IDs <- read.csv(file = "packages.csv", header = TRUE, 
                    stringsAsFactors = FALSE, quote = "\"",
                    colClasses = c("character","character","logical"))
    if(sum(IDs$Packages_ID == ID) != 1){
        stop("Error", call. = FALSE)
    }
    IDs[IDs$Packages_ID == ID, 3] <- Rcvd
    if(Desc != "existing") IDs[IDs$Packages_ID == ID, 2] <- Desc
    write.csv(x = IDs, file = "packages.csv", row.names = FALSE)
}

cleanCSV <- function(){
    rcvdPackages <- read.csv(file = "receivedPackages.csv", header = TRUE,
                             stringsAsFactors = FALSE, quote = "\"",
                             colClasses = c("character","character","logical"))
    IDs <- read.csv(file = "packages.csv", header = TRUE, 
                    stringsAsFactors = FALSE, quote = "\"")
    rcvdPackages <- rbind(rcvdPackages, IDs[IDs$Received == TRUE, ])
    IDs <- IDs[IDs$Received == FALSE, ]
    write.csv(x = rcvdPackages, file = "receivedPackages.csv", row.names = FALSE)
    write.csv(x = IDs, file = "packages.csv", row.names = FALSE)
}