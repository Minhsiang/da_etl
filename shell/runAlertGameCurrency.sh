SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.alert.ownerGameRecallAlert.ownerGameRecallAlert_task detectCurrencyGame \
--workers 1 \
--rangeTime 5 \
--teamPlusChatSN-recallOwnerGameAlert '["1742"]' \
--teamPlusChatSN-recallOwnerGameLessMessageAlert '["800"]' \
--teamPlusChatSN-recallOwnerGameMoreMessageAlert '["84"]' \
> /tmp/detectGameCurrency/${NOW}.log 2>&1

