ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN wget -O /opt/go-crond https://github.com/webdevops/go-crond/releases/download/0.6.1/go-crond-arm-linux && \
  chmod a+x /opt/go-crond
RUN apt-get update && apt-get install -y jq

COPY influx-backup/backup-database.sh /opt/scripts/
RUN chmod a+x /opt/scripts/backup-database.sh
COPY backup.cron /cron-templates/
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
