SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

for h in {00..23}; do
	python3 -m luigi --module projects.dataWarehouse.reviseOrderAnalysis2SQLHourly_task reviseOrderAnalysis2SQL \
	--workers 15 \
	--reviseType 0 \
	--start $(date -u -d "-1 day" +%Y-%m-%dT${h})  \
	>> /tmp/DT_hour2day_order/reviseOrderAnalysis2SQL_${NOW}.log 2>&1
done

python3 -m luigi --module projects.dataWarehouse.reviseOrderHour2Daily_task reviseGetParentsDaily \
--workers 1 \
--reviseType 0 \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
>> /tmp/DT_hour2day_order/reviseGetParentsDaily_${NOW}.log 2>&1

python3 -m luigi --module projects.dataWarehouse.reviseOrderHour2Daily_task reviseOrderHour2Daily \
--workers 15 \
--reviseType 0 \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
>> /tmp/DT_hour2day_order/reviseDay_${NOW}.log 2>&1

#python3 -m luigi --module projects.dataWarehouse.reviseOrderHour2Daily_task RangeDailyBase \
#--of reviseGetParentsDaily \
#--of-params '{"reviseType":0}' \
#--start $(date -u -d "-1 day" +%Y-%m-%d) \
#--stop $(date -u +%Y-%m-%d) \
#--workers 15 \
#--task-limit 240 \
#>> /tmp/DT_hour2day_order/reviseGetParentsDaily_${NOW}.log 2>&1
#
#python3 -m luigi --module projects.dataWarehouse.reviseOrderHour2Daily_task RangeDailyBase \
#--of reviseOrderHour2Daily \
#--of-params '{"reviseType":0}' \
#--start $(date -u -d "-1 day" +%Y-%m-%d) \
#--stop $(date -u +%Y-%m-%d) \
#--workers 15 \
#--task-limit 240 \
#>> /tmp/DT_hour2day_order/reviseDay_${NOW}.log 2>&1

