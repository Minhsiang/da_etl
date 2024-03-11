SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.gameInfo_task resetGameInfo \
--workers 1 \
--recommendGameSetting-cq9GameTeam ${CQ9_GAME_TEAM} \
--gameInfoSetting-defaultMaxScore 1 \
--gameInfoSetting-defaultMaxMultiplier 1 \
> /tmp/BtoB_resetGameInfo/${NOW}.log 2>&1

