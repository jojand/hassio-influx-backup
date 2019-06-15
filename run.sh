#!/bin/sh

cat /data/options.json

# TMP_DIR="/tmp/influx-backup"
# DB_NAME="home_assistant"

# mkdir -p ${TMP_DIR}

# influxd backup -database "${DB_NAME}" -host '53caca22-influxdb:8088' ${TMP_DIR}

# DATE=$(date +%Y%m%d_%H%M)

# cd /tmp
# tar cvzf /share/${DATE}_${DB_NAME}.tar.gz influx-backup/
