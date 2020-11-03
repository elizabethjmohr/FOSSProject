# Start with a container that has the latest version of R and tidyverse installed
FROM rocker/tidyverse:latest

# create dir
RUN mkdir -p /analyses

# Copy Files
COPY /analyses/downloadNEONData.R /analyses/downloadNEONData.R
COPY /analyses/plotNEONData.R /analyses/plotNEONData.R
COPY /install_packages.R /install_packages.R

# install neonUtilitis package
Run Rscript /install_packages.R

# Run download
CMD Rscript /analyses/downloadNEONData.R "2020-09" "MART"

# plot
CMD Rscript /analyses/plotNEONData.R "2020-09" 
