FROM rocker/r-ver:3.5.3

WORKDIR /srv/shiny-server/

RUN apt-get update && apt-get install -y --no-install-recommends libxml2-dev && \
    R -e "install.packages(c('wordcloud', 'tm', 'shiny'))" && \
    apt-get purge -y --auto-remove libxml2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m shiny && \
    chown shiny:shiny /srv/shiny-server/


COPY server.R ui.R run.R ./
ENV PORT=3838

USER shiny
CMD ["R", "--no-save", "--gui-none", "-f", "./run.R"]
