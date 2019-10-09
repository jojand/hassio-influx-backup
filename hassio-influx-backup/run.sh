#!/bin/sh

DB_NAME=$(jq -r '.database.name' /data/options.json)
DB_HOST=$(jq -r '.database.host' /data/options.json)
CRON_EXPR=$(jq -r '.database.cron' /data/options.json)

# init cron
mkdir /cron
cat /cron-templates/backup.cron | sed -e "s/{cron}/${CRON_EXPR}/g" > /cron/backup.cron

/opt/go-crond --allow-unprivileged --include=/cron
