SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.AB3_bulletsStat_task RangeDailyBase \
--of AB3_dataByDay \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
--stop $(date -u +%Y-%m-%d) \
--workers 1 \
>> /tmp/DT_AB3/${NOW}.log 2>&1

