SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.dataWarehouse.transaction_task RangeDailyBase \
--of transbyDay \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
--stop $(date -u +%Y-%m-%d) \
--workers 5 \
>> /tmp/DT_hour2day_transaction/${NOW}.log 2>&1

