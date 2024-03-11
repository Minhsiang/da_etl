SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.cluster.weekCluster_task weekCluster \
--workers 5 \
--startDate $(date  --date="7 days ago" +"%Y-%m-%d") \
--weekKmedoidsModel-cumulativeRange 12 \
--weekKmedoidsModel-sampleSize 3000 \
--weekKmedoidsModel-trainingTimes 10000 \
--weekKmedoidsModel-clusters '{"avgBetByDay": 5, "avgDuration": 3,"avgBetByRound": 4}' \
>> /tmp/DT_cluster/${NOW}_week.log 2>&1

