SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.playerSystem.userInfoByDay_task RangeDailyBase \
--of ps_userInfoDaily \
--start $(date -u -d "-1 day" +%Y-%m-%d) \
--stop $(date -u +%Y-%m-%d) \
--workers 15 \
>> /tmp/PS_userInfoDaily/${NOW}.log 2>&1

