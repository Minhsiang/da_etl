SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.betDistribution_task betDistribution \
--workers 20 \
--numOfWorker 20 \
--startDate $(date  --date="7 days ago" +"%Y-%m-%d") \
> /tmp/DT_bet/${NOW}.log 2>&1

