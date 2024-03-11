SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.dataWarehouse.hitRecommendGame_task RangeHourlyBase \
--of hitRecommendGame \
--start $(date -u -d '-10 hour' +%Y-%m-%dT%H) \
--stop $(date -u -d '-9 hour' +%Y-%m-%dT%H) \
--workers 15 \
>> /tmp/DT_recommendGame/${NOW}.log 2>&1

