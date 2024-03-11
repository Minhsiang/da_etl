
SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.hotRankingGame_task hotRankingGame \
--workers 1 \
--recommendGameSetting-cq9GameTeam ${CQ9_GAME_TEAM} \
--recommendGameSetting-ignoredGameList ${IGNORED_GAME_LIST} \
--hotRankingGameSetting-games 10 \
--hotRankingGameSetting-hours 10 \
--hotRankingGameSetting-rtpMin 0.93 \
--hotRankingGameSetting-rtpMax 0.95 \
> /tmp/BtoB_hotRanking/${NOW}.log 2>&1

