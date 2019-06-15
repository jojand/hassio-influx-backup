#!/bin/sh

DB_NAME=$1
INFLUX_HOST=$2
TMP_DIR="influx-backup-${DB_NAME}"

echo "$(date +%Y%m%d_%H%M) ${TMP_DIR}"

#rm -rf /tmp/${TMP_DIR}
#mkdir -p /tmp/${TMP_DIR}
#influxd backup -database "${DB_NAME}" -host '53caca22-influxdb:8088' ${TMP_DIR}
#DATE=$(date +%Y%m%d_%H%M)
#cd /tmp
#tar cvzf /share/${DATE}_${DB_NAME}.tar.gz influx-backup/
