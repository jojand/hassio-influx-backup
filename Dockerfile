ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apt-get update && \
  apt-get install -y python3-pip && \
  pip3 install pycron

COPY influx-backup/ /influx-backup

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
