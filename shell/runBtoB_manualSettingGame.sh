SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.manualSettingGame_task manualSettingGame \
--workers 1 \
> /tmp/BtoB_manualSettingGame/${NOW}.log 2>&1

