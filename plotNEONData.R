library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
YEARMONTH <- args[1]

dataPath <- paste0("data/", YEARMONTH)
files <- list.files(path = dataPath)
fileNames <- paste0(dataPath, "/", files)
results <- lapply(fileNames, function(x) mget(load(x))) %>%
  unlist(recursive = FALSE) %>%
  bind_rows()

monthPath <- paste0("plots/", YEARMONTH)
if(!dir.exists(monthPath)){
  dir.create(monthPath)
}

myPlot <- ggplot(data = results, aes(x = dateTime, y = do, color = site)) +
  geom_line()+
  xlab("Date") +
  ylab("Dissolved Oxygen Concentration (mg/L)")

ggsave(paste0(monthPath,"/",YEARMONTH, ".png"),
       plot = myPlot,
       device = "png")
