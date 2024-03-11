SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.playerSystem.treasureRecordByHour_task RangeHourlyBase \
--of ps_treasureRecord \
--start $(date -u -d '-3 hour' +%Y-%m-%dT%H) \
--stop $(date -u -d '-2 hour' +%Y-%m-%dT%H) \
--workers 1 \
>> /tmp/PS_treasureRecordByHour/${NOW}.log 2>&1

