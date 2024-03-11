SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.cluster.monthCluster_task RangeMonthly \
--of monthCluster \
--start $(date -d "-1 month" +%Y-%m) \
--monthKmedoidsModel-sampleSize 5000 \
--monthKmedoidsModel-trainingTimes 10000 \
--monthKmedoidsModel-clusters '{"avgBetByDay": 5, "avgDuration": 3, "days":4, "avgBetByRound": 4}' \
--workers 5 \
>> /tmp/DT_cluster/${NOW}_month.log 2>&1

