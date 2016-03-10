trackMyPackages <- function(){
    # Place the tracking numbers in trackIDs here...
    trackIDs <- c("RA548921599DE",
                  "RN262336226GB",
                  "RA128783708SI",
                  "RB782044557DE")

    source(file = "trackPackage.R")
    WhereAreThey <- as.data.frame(lapply(X = trackIDs, FUN = trackPackage),
                                  stringsAsFactors = FALSE)
    names(WhereAreThey) <- WhereAreThey[1,]
    WhereAreThey <- WhereAreThey[2:3,]
    return(WhereAreThey)
}