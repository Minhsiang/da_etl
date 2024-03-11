SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.GO02_bulletsStat_task RangeMonthly \
--of GO02bulletsStat \
--start $(date -d "-1 month" +%Y-%m) \
> /tmp/DT_GO02_bullets_stat/${NOW}.log 2>&1

python3 -m luigi --module projects.GO02_bulletsStat_task RangeMonthly \
--of GOCurrencyDenom \
--start $(date -d "-1 month" +%Y-%m) \
>> /tmp/DT_GO02_bullets_stat/${NOW}.log 2>&1
