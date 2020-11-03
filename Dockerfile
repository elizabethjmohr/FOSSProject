# Start with a container that has the latest version of R and tidyverse installed
FROM rocker/tidyverse:latest

# create dir
RUN mkdir -p /analyses
RUN mkdir -p /data
RUN mkdir -p /plots

# Copy scripts
COPY /analyses/downloadNEONData.R /analyses/downloadNEONData.R
COPY /analyses/plotNEONData.R /analyses/plotNEONData.R
COPY /install_packages.R /install_packages.R

# install neonUtilities package
RUN Rscript /install_packages.R

# Run download
RUN Rscript /analyses/downloadNEONData.R "2020-09" "MART"
RUN Rscript /analyses/downloadNEONData.R "2020-09" "SYCA"
RUN Rscript /analyses/downloadNEONData.R "2020-09" "POSE"

# plot
CMD Rscript /analyses/plotNEONData.R "2020-09"
