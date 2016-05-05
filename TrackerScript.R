#  Packages
# "RA128783708SI" - 5 1 kurus
# "RA471329095DE" - Incl Bafa - Received
# "RA548921599DE"
# "RB882050630DE" - Savoca 5 lots - Received
# "RB033236168DE" - Solidus 2 lots - Received
# "RB516620411DE" - Arab Byzantine coin - Received
# "RB782044557DE" - Savoca 3 lot package
# "RB882050630DE" - Savoca package - Received
# "RB882054906DE" - Savoca 1 coin - Received
# "RG011796925DE" - Arab Byzantine Book
# "RN256013306GB" - Naville Arab-Byzantine - Received
# "RN262336226GB" - Roma coin - Received
# "RR1815899110AL" - 1293/33 2k - Received
# "RB882053052DE" - Savoca multi lot - Received
# "9200190164917330224869" - Wallet knife - Received
# "RR109944566TR" - Uslu Mezat 52
# "9300189843900087075351" - Etsy package - Received

trackMyPackages <- function(){
    # Place the tracking numbers in trackIDs here...
    trackIDs <- c("RR109944566TR")

    source(file = "trackPackage.R")
    WhereAreThey <- as.data.frame(lapply(X = trackIDs, FUN = trackPackage),
                                  stringsAsFactors = FALSE)
    names(WhereAreThey) <- WhereAreThey[1,]
    WhereAreThey <- WhereAreThey[2:3,]
    return(WhereAreThey)
}