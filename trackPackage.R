trackPackage <- function(trackID) {
    suppressWarnings(library(httr))
    suppressWarnings(library(jsonlite))
    suppressWarnings(library(XML))
    
    ans <- trackID
    url <- "http://production.shippingapis.com/ShippingApi.dll?API=TrackV2&XML="
    xml.request.1 <- '<TrackFieldRequest USERID="242SELF05954"><TrackID ID="'
    xml.request.3 <- '"></TrackID></TrackFieldRequest>'
    xml.request <- URLencode(paste(xml.request.1,ans,xml.request.3,sep=""))
    strGet <- paste(url, xml.request, sep="")
    r <- GET(strGet)
    if(http_status(r)$category == "Success") {
        # Got a response
        r.xml <- content(r, "text", encoding = "ISO-8859-1")
        xml.l <- xmlToList(r.xml)
        # Now need to figure out how to parse the data and display it!
        # If you've got $TrackInfo$TrackSummary then you've got info
        # If you've got $TrackInfo$Error then there's something wrong
        if ("Error" %in% names(xml.l$TrackInfo)) {
            # Had an error
            ans <- rbind(ans,
                         ", ",
                         xml.l$TrackInfo$Error$Description)
            rownames(ans) <- c("PackageID", "Time","Status")
        } else {
            # No error, give last details
            EventDate <- xml.l$TrackInfo$TrackSummary$EventDate
            EventTime <- xml.l$TrackInfo$TrackSummary$EventTime
            Event <- xml.l$TrackInfo$TrackSummary$Event
            EventCity <- xml.l$TrackInfo$TrackSummary$EventCity
            ans <- rbind(ans,
                         paste(EventDate, ", ",EventTime, sep = ""))
            ans <- rbind(ans,
                         paste(Event, ", ", EventCity, sep = ""))
            rownames(ans) <- c("PackageID", "Time", "Status")
        }
    }
    return(ans)
}