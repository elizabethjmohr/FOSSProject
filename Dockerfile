# Start with a container that has the latest version of R installed
FROM rocker/tidyverse:latest

# create dir
RUN mkdir -p /analyses

# Copy Files
COPY /analyses/downloadNEONData.R /analyses/downloadNEONData.R
COPY /analyses/plotNEONData.R /analyses/plotNEONData.R

# Run download
CMD Rscript /analyses/downloadNEONData.R

# plot
CMD Rscript /analyses/plotNEONData.R
