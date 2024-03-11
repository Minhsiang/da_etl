SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.dataWarehouse.orderAnalysis2SQLHourly_task RangeHourlyBase \
--of orderAnalysis2SQL \
--start $(date -u -d '-1 hour' +%Y-%m-%dT%H) \
--stop $(date -u  +%Y-%m-%dT%H) \
--workers 15 \
>> /tmp/DT_order/${NOW}.log 2>&1

