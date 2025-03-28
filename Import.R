gridcoo <- read.table("gridpoints_coordinates.txt", head = TRUE)

## Precipitation
zipgrid <- unz("r_grid_19712023.txt.zip", "r_grid_19712023.txt")
fejlec <- read.fwf(zipgrid, widths = rep(8, 1234), n = 1)
alldata <- read.fwf(zipgrid, widths = rep(8, 1234), skip = 1)
fejlec[1,1] <- "Date"
names(alldata) <- fejlec
JaszfelsoGrid <- alldata[,c("Date", "700")]
GridDate <- seq.Date(from = as.Date("1971-01-01"), to = as.Date("2023-12-31"), by = "days")
plot(GridDate, JaszfelsoGrid[,2], type = "l")
## Time-series
library(xts)
Jaszfelso.xts <- xts(JaszfelsoGrid[,2], GridDate)
plot(Jaszfelso.xts['1991/2020'])

summary(apply.yearly(Jaszfelso.xts['1991/2020'], sum))
