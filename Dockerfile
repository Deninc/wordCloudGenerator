# builder
FROM rocker/shiny:3.5.3 as builder
RUN apt-get update && apt-get install -y --no-install-recommends libxml2-dev && \
    R -e "install.packages(c('wordcloud', 'tm'))"

# prod image
FROM rocker/r-ver:3.5.3
COPY --from=builder /usr/local/bin/R /usr/local/bin/R
COPY --from=builder /usr/local/lib/R /usr/local/lib/R
COPY --from=builder /usr/local/bin/Rscript /usr/local/bin/Rscript
COPY --from=builder /opt/shiny-server /opt/shiny-server
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

WORKDIR /srv/shiny-server/
COPY server.R ui.R ./

RUN mkdir -p /var/log/shiny-server && \
    mkdir -p /var/lib/shiny-server && \
    ln -s /opt/shiny-server/bin/shiny-server /usr/bin/shiny-server && \
    useradd -m shiny && \
    chown shiny:shiny /srv/shiny-server/ && \
    chown shiny:shiny /var/log/shiny-server && \
    chown shiny:shiny /var/lib/shiny-server

USER shiny
CMD ["shiny-server"]
