## global.R ##
library(dplyr)
library(leaflet)

# Set directory to whereever you've downloaded the code repo
# setwd("~/benchmarking-data-explorer/")

#load various data sets
clean_bm <- tbl_df(read.csv("https://raw.githubusercontent.com/afeierman/benchmarking-data-explorer/master/data/clean_bm.csv"))
full_zips <- tbl_df(read.csv("https://raw.githubusercontent.com/afeierman/benchmarking-data-explorer/master/data/full_zips.csv"))

cities <- c("New York City" = "New York City",
            "Washington, DC" = "DC",
            "San Francisco" = "San Francisco")

mapcities <- c("New York City" = "NYC",
            "Washington, DC" = "DC",
            "San Francisco" = "San Francisco")

qpal <- colorQuantile(colorRamp(c("#0000FF", "#FF0000"), interpolate = "spline"), 
                      full_zips$MedSourceEUI, n = 10)

plotxvalues = c("Weather Normalized Source EUI" = "NormSourceEUI",
                "Site EUI" = "SiteEUI", 
                "Source EUI" = "SourceEUI", 
                "Weather Normalized Site EUI" = "NormSiteEUI")

plotyvalues = c("Reported Floor Area" = "ReportedGFA")

plotrev = c("Year" = "Year",
            "NormSourceEUI" = "Weather Normalized Source EUI",
            "ReportedGFA" = "Reported Floor Area",
            "SiteEUI" = "Site EUI",
            "SourceEUI" = "Source EUI",
            "NormSiteEUI", "Weather Normalized Site EUI")

#Having trouble loading in RDS or RDATA files, so setting data types here to make code more universally accessible:
clean_bm$city <- as.character(clean_bm$city)
clean_bm$Borough <- as.factor(clean_bm$Borough)
clean_bm$Zip.Code <- as.integer(clean_bm$Zip.Code)
clean_bm$SiteEUI <- as.numeric(clean_bm$SiteEUI)
clean_bm$NormSiteEUI <- as.numeric(clean_bm$NormSiteEUI)
clean_bm$SourceEUI <- as.numeric(clean_bm$SourceEUI)
clean_bm$NormSourceEUI <- as.numeric(clean_bm$NormSourceEUI)
clean_bm$ENERGY.STAR.Score <- as.integer(clean_bm$ENERGY.STAR.Score)
clean_bm$ReportedGFA <- as.numeric(clean_bm$ReportedGFA)
clean_bm$GovGFA <- as.integer(clean_bm$GovGFA)
clean_bm$PropType <- as.factor(clean_bm$PropType)
clean_bm$Year <- as.integer(clean_bm$Year)
clean_bm$Ward <- as.factor(clean_bm$Ward)
clean_bm$Building.Name <- as.character(clean_bm$Building.Name)
clean_bm$Building.Address <- as.character(clean_bm$Building.Address)

