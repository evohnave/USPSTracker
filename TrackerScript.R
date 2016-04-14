#  Packages
# "RA128783708SI" - 5 1 kurus
# "RA471329095DE" - Incl Bafa - received
# "RA548921599DE"
# "RB033236168DE" - Solidus 2 lots - Delivered
# "RB516620411DE" - Arab Byzantine coin - received
# "RB782044557DE" - Savoca 3 lot package
# "RB882050630DE" - Savoca package
# "RG011796925DE" - Arab Byzantine Book
# "RN256013306GB" - Naville Arab-Byzantine - received
# "RN262336226GB" - Roma coin
# "RR1815899110AL" - 1293/33 2k

trackMyPackages <- function(){
    # Place the tracking numbers in trackIDs here...
    trackIDs <- c("RB882050630DE",
                  "RN262336226GB",
                  "RR1815899110AL")

    source(file = "trackPackage.R")
    WhereAreThey <- as.data.frame(lapply(X = trackIDs, FUN = trackPackage),
                                  stringsAsFactors = FALSE)
    names(WhereAreThey) <- WhereAreThey[1,]
    WhereAreThey <- WhereAreThey[2:3,]
    return(WhereAreThey)
}