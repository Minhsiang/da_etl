SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

python3 -m luigi --module projects.redenvInfo_task redenvInfo \
--workers 1 \
--startPromotionRedenvID 12610634 \
> /tmp/DT_redenvInfo/${NOW}.log 2>&1

