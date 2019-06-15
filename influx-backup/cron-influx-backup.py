import pycron
import datetime
import time
import subprocess

DB_NAME = 'home_assistant'
DB_HOST = '53caca22-influxdb:8088'


def main():
    last_run = 0
    while True:
        if pycron.is_now('* * * * *'):
            now = time.time()
            if (now - last_run) > 60:
                print('{} Starting backup'.format(datetime.datetime.now()))
                subprocess.run(['bash', '/influx-backup/backup-database.sh', DB_NAME, DB_HOST])
                last_run = now
        time.sleep(55)


if __name__ == '__main__':
    print('cron-influx-backup')
    main()
