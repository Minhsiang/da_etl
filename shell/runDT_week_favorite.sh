SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.favoriteGame_task favoriteGame \
--workers 10 \
--numOfWorker 10 \
--startDate $(date  --date="7 days ago" +"%Y-%m-%d") \
> /tmp/DT_favorite/${NOW}.log 2>&1

