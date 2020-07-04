FROM rocker/shiny:3.5.3

RUN apt-get update && apt-get install -y libxml2-dev

RUN R -e "install.packages(c('wordcloud', 'tm'))"

WORKDIR /srv/shiny-server/

COPY server.R ui.R /srv/shiny-server/

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
