SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.playerIpConvertGeoLocation_task RangeDailyBase \
--of playerIpConvertGeoLocation \
--start $(date -d "-1 day" +%Y-%m-%d) \
--stop $(date +%Y-%m-%d) \
--of-params '{"numOfWorker":5}' \
--workers 5 \
>> /tmp/DT_IPConvert/${NOW}.log 2>&1

