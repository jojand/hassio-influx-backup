#!/bin/sh

DB_NAME=$(jq -r '.database.name' /data/options.json)
DB_HOST=$(jq -r '.database.host' /data/options.json)
CRON_EXPR=$(jq -r '.database.cron' /data/options.json)

echo "$DB_HOST"
echo "$DB_HOST"
echo "$CRON_EXPR"

TMP_DIR="influx-backup-${DB_NAME}"

echo "$(date +%Y%m%d_%H%M) ${TMP_DIR} running backup" >> /share/backup.log

# clean previous backup
rm /share/*_home_assistant.tar.gz

rm -rf /tmp/${TMP_DIR}
mkdir -p /tmp/${TMP_DIR}
cd /tmp
influxd backup -database "${DB_NAME}" -host '53caca22-influxdb:8088' ${TMP_DIR}
DATE=$(date +%Y%m%d_%H%M)
tar cvzf /share/${DATE}_${DB_NAME}.tar.gz ${TMP_DIR}
