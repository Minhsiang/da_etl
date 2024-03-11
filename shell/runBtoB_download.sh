SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.downloadGoogleFile_task downloadGoogleFile \
--workers 1 \
> /tmp/BtoB_download/${NOW}.log 2>&1

