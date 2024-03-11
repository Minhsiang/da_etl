SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.manualSettingGame_task setManualSettingGame \
--workers 1 \
--recommendGameSetting-cq9GameTeam ${CQ9_GAME_TEAM} \
--manualSettingGameSetting-games 11 \
--manualSettingGameSetting-days 90 \
--manualGivenGameSetting-ssid '{"5c4e7de7ee63e30001242594":"160,52,179,105,7,50,99,64,89,31,138"}' \
> /tmp/DT_setManualSettingGame/${NOW}.log 2>&1

