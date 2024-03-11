SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.alert.ownerGameRecallAlert.ownerGameRecallAlert_task detectGame \
--workers 1 \
--rangeTime 2 \
--teamPlusChatSN-recallOwnerGameAlert '["1742"]' \
--teamPlusChatSN-recallOwnerGameLessMessageAlert '["800"]' \
--teamPlusChatSN-recallOwnerGameMoreMessageAlert '["84"]' \
--FalsePositiveSetting-rateOfNetwinLimit 0.5 \
--FalsePositiveSetting-numOfRounds 8 \
> /tmp/detectRecallOwnerGame/${NOW}.log 2>&1

