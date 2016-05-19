getTrackedIDs <- function(all = FALSE){
    IDs <- read.csv(file = "packages.csv", header = TRUE, 
                    stringsAsFactors = FALSE, quote = "\"")
    return(IDs[IDs$Received <= all, 1])
}

trackMyPackages <- function(){

    trackIDs <- getTrackedIDs()

    source(file = "trackPackage.R")
    WhereAreThey <- as.data.frame(lapply(X = trackIDs, FUN = trackPackage),
                                  stringsAsFactors = FALSE)
    names(WhereAreThey) <- WhereAreThey[1,]
    WhereAreThey <- WhereAreThey[2:3,]
    return(WhereAreThey)
}

updateCSV <- function(ID, Desc, Rcvd = FALSE){
    IDs <- read.csv(file = "packages.csv", header = TRUE, 
                    stringsAsFactors = FALSE, quote = "\"")
    newLine <- dim(IDs)[1] + 1
    IDs[newLine, 1] <- ID
    IDs[newLine, 2] <- Desc
    IDs[newLine, 3] <- Rcvd
    write.csv(x = IDs, file = "packages.csv", row.names = FALSE)
}