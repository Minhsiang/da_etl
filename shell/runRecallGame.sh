SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.alert.ownerGameRecallAlert.ownerGameRecallAlert_task recallGame \
--workers 1 \
> /tmp/detectRecallOwnerGame/${NOW}.log 2>&1


