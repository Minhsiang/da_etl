SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.parentClosedGame_task parentClosedGame \
--workers 1 \
--recommendGameSetting-cq9GameTeam ${CQ9_GAME_TEAM} \
> /tmp/BtoB_parentClosedGame/${NOW}.log 2>&1

