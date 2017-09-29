# using openanalytics/r-base, ubuntu and R is installed 
FROM openanalytics/r-base

MAINTAINER Takuya Noguchi "noguchit@gmail.com"

# adding required libraries
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0

# packages needed for basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown', 'tm','wordcloud','memoise','ggvis', 'dplyr', 'RSQLite', 'dbplyr'),  repos='https://cloud.r-project.org/')"

# installing shinyproxy package with demo shiny application
# removing shinyproxy_0.0.1 package after installing the package
COPY shinyproxy_0.0.1.tar.gz /root/
RUN R CMD INSTALL /root/shinyproxy_0.0.1.tar.gz
RUN rm /root/shinyproxy_0.0.1.tar.gz

# set host and port
COPY Rprofile.site /usr/lib/R/etc/

# copy app to the image
# ui.R, server.R, global.R, and data files are in the app folder
RUN mkdir /root/wordcount
COPY app /root/wordcount

# copy app2 to the image
RUN mkdir /root/movie
COPY app2 /root/movie

# shiny app communicates using port 3838
# shiny.port = 3838 is defined in Rprofile.site file
EXPOSE 3838

# you may not need this
CMD ["R", "-e shinyproxy::run_01_hello()"]
