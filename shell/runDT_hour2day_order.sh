SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.dataWarehouse.orderHour2Daily_task getParentsDaily \
--workers 1 \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
>> /tmp/DT_hour2day_order/getParentsDaily_${NOW}.log 2>&1

python3 -m luigi --module projects.dataWarehouse.orderHour2Daily_task orderHour2Daily \
--workers 15 \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
>> /tmp/DT_hour2day_order/${NOW}.log 2>&1


#python3 -m luigi --module projects.dataWarehouse.orderHour2Daily_task RangeDailyBase \
#--of getParentsDaily \
#--start $(date -u -d "-1 day" +%Y-%m-%d) \
#--stop $(date -u +%Y-%m-%d) \
#--workers 15 \
#--task-limit 240 \
#>> /tmp/DT_hour2day_order/getParentsDaily_${NOW}.log 2>&1
#
#python3 -m luigi --module projects.dataWarehouse.orderHour2Daily_task RangeDailyBase \
#--of orderHour2Daily \
#--start $(date -u -d "-1 day" +%Y-%m-%d) \
#--stop $(date -u +%Y-%m-%d) \
#--workers 15 \
#--task-limit 240 \
#>> /tmp/DT_hour2day_order/${NOW}.log 2>&1

