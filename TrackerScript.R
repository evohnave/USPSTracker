# Delivered packages
# "RA548921599DE",
# "RG011796925DE" - Arab Byzantine Book
# "RN262336226GB" - Roma coin
# "RA128783708SI" - 5 1 kurus
# "RA471329095DE" - Incl Bafa

trackMyPackages <- function(){
    # Place the tracking numbers in trackIDs here...
    trackIDs <- c("RB782044557DE",
                  "RA128783708SI",
                  "RA471329095DE")

    source(file = "trackPackage.R")
    WhereAreThey <- as.data.frame(lapply(X = trackIDs, FUN = trackPackage),
                                  stringsAsFactors = FALSE)
    names(WhereAreThey) <- WhereAreThey[1,]
    WhereAreThey <- WhereAreThey[2:3,]
    return(WhereAreThey)
}