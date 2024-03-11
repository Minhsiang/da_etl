
SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.GO_fishGame_task RangeDailyBase \
--of GO_playerFishGameData \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
--stop $(date -u +%Y-%m-%d) \
--workers 1 \
>> /tmp/DT_GO_fishGame/${NOW}.log 2>&1

