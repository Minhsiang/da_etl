SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )
source ${SCRIPTDIR}/base.sh

date_array=("2024-02-04" "2024-02-12")
revise_type=2

for date in ${date_array[@]};do
	for h in {00..23}; do
		python3 -m luigi --module projects.dataWarehouse.reviseOrderAnalysis2SQLHourly_task reviseOrderAnalysis2SQL \
		--workers 15 \
		--reviseType ${revise_type} \
		--start "${date}T${h}"  \
		>> /tmp/DT_hour2day_order/reviseOrderAnalysis2SQL_${NOW}.log 2>&1
	done

	python3 -m luigi --module projects.dataWarehouse.reviseOrderHour2Daily_task reviseGetParentsDaily \
	--workers 1 \
	--reviseType ${revise_type} \
	--start ${date} \
	>> /tmp/DT_hour2day_order/reviseGetParentsDaily_${NOW}.log 2>&1

	python3 -m luigi --module projects.dataWarehouse.reviseOrderHour2Daily_task reviseOrderHour2Daily \
	--workers 15 \
	--reviseType ${revise_type} \
	--start ${date} \
	>> /tmp/DT_hour2day_order/reviseDay_${NOW}.log 2>&1
done

