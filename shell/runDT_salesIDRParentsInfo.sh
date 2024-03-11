
SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.sales_parents_info_task RangeMonthly \
--of sendResult \
--start $(date -d "-1 month" +%Y-%m) \
--of-params '{"ownerSSID":"5df376beb7fe2c0001e806fb","sendMailList":["patrickstar0345@agtoday.xyz","michelle0612@agtoday.xyz","hyoyo0497@agtoday.xyz","anne0366@agtoday.xyz"]}' \
--workers 1 \
>> /tmp/DT_salesIDRParentsInfo/${NOW}.log 2>&1

