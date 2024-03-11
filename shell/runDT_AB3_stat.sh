SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.AB3_bulletsStat_task RangeMonthly \
--of AB3_stat \
--start $(date -u -d "-1 month" +%Y-%m) \
--stop $(date -u  +%Y-%m) \
--workers 15 \
>> /tmp/DT_AB3/${NOW}.log 2>&1

