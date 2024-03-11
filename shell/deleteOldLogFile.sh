find /tmp/DT_* -type f -ctime +5 | xargs rm -rf
find /tmp/DT_order -type f -ctime +1 | xargs rm -rf
find /tmp/BtoB_* -type f -ctime +1 | xargs rm -rf
find /home/da02_saturn2022_work/officalSource/luigi/files/ -name "*" -type f -ctime +40 | xargs rm -rf
