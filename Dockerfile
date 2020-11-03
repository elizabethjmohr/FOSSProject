# Start with a container that has the latest version of R and tidyverse installed
FROM rocker/tidyverse:latest

# install neonUtilities package
RUN Rscript /install_packages.R

# create dir
RUN mkdir -p /analyses

# Copy Files
COPY /analyses/downloadNEONData.R /analyses/downloadNEONData.R
COPY /analyses/plotNEONData.R /analyses/plotNEONData.R

# Run download
CMD Rscript /analyses/downloadNEONData.R "2020-09" "MART"

# plot
CMD Rscript /analyses/plotNEONData.R "2020-09" 
