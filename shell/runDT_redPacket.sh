SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.dataWarehouse.redPacket_task RangeHourlyBase \
--of redPacket \
--start $(date -u -d '-1 hour' +%Y-%m-%dT%H) \
--stop $(date -u +%Y-%m-%dT%H) \
--workers 1 \
>> /tmp/DT_redPacket/${NOW}.log 2>&1

