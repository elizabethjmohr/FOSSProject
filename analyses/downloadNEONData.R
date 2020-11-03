library(neonUtilities)
NEON_TOKEN <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJlbGl6YWJldGhqbW9ockBnbWFpbC5jb20iLCJzY29wZSI6InJhdGU6cHVibGljIiwiaXNzIjoiaHR0cHM6Ly9kYXRhLm5lb25zY2llbmNlLm9yZy8iLCJleHAiOjE3NTExNDIyMzIsImlhdCI6MTU5MzQ2MjIzMiwiZW1haWwiOiJlbGl6YWJldGhqbW9ockBnbWFpbC5jb20ifQ.WHmJi-qJ8W8c5ORzHUjPIpiTeYxgAUGVbNrWl4hd-fqoGi8e6cAxJZQKhU3slmu5FUz2zfVoTgfuiXeNAKj0dg"

args <- commandArgs(trailingOnly = TRUE)
SITE <- args[1]
YEARMONTH <- args[2]

waq <- loadByProduct(dpID="DP1.20288.001",
                     site=SITE,
                     startdate=YEARMONTH,
                     enddate=YEARMONTH,
                     package="basic",
                     token = NEON_TOKEN,
                     check.size = F)
do <- data.frame(
  dateTime = waq$waq_instantaneous$startDateTime,
  do = waq$waq_instantaneous$dissolvedOxygen,
  site = SITE
)

monthPath <- paste0("data/", YEARMONTH)
if(!dir.exists(monthPath)){
  dir.create(monthPath)
}

save(do,
     file = paste0("data/", YEARMONTH, "/", SITE, ".rds"))
  
