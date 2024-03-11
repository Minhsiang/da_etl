SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.parentSingleRTP_task parentSingleRTP \
--workers 1 \
> /tmp/DT_parentSingleRTP/${NOW}.log 2>&1

