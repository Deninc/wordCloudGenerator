FROM rocker/r-ver:4
WORKDIR /srv/shiny-server/

RUN install2.r --error shiny wordcloud tm

RUN useradd -m shiny && \
    chown shiny:shiny /srv/shiny-server/

COPY server.R ui.R run.R ./
ENV PORT=3838

USER shiny
CMD ["R", "--no-save", "--gui-none", "-f", "./run.R"]
