SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.recommendGame_task allRecommendGame \
--workers 3 \
--recommendGameSetting-currency '["CNY","KRW","VND","THB","IDR"]' \
--recommendGameSetting-days 30 \
--recommendGameSetting-games 15 \
--recommendGameSetting-cq9GameTeam ${CQ9_GAME_TEAM} \
--recommendGameSetting-ignoredGameList ${IGNORED_GAME_LIST} \
--aprioriSetting-minSupport 0.005 \
--aprioriSetting-maxLen 2 \
--associationRulesSetting-minThreshold 1.2 \
> /tmp/BtoB_recommendGame/${NOW}.log 2>&1

