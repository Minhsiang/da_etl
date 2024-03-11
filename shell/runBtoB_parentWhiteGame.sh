SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.BtoB_RG_DataProvider.parentWhiteGame_task parentWhiteGame \
--SSIDs '["5b7e736952e2650001661230","5aaf5b5f453500000146f0be","5a6fce5c0ed16400019489ba","5cac69cd5924ae0001e17c8c"]'	\
--givenSettingSSIDs '{"64b503dfbca8d3626df62734":"DA11","653b2259304870ff6a26b036":"DA11","653bb47d418daf7a8a9637f3":"DA11","5d146900ca32960001b614ce":"DA11","5e0dac1d11af570001ad6f78":"DA11"}' \
--workers 1 \
> /tmp/BtoB_parentWhiteGame/${NOW}.log 2>&1

