trackMyPackages <- function(){
    # Place the tracking numbers in trackIDs here...
    trackIDs <- c("RA548921599DE",
                  "RN262336226GB",
                  "RA128783708SI",
                  "RB782044557DE")

    source(file = "trackPackage.R")
    lapply(X = trackIDs, FUN = trackPackage)
}