cwf () {
	while getopts "o:r:" opt
	do
		case $opt in
			(o) ORG="${OPTARG}"  ;;
			(r) REPO="${OPTARG}"  ;;
			(*) echo "Usage $0 -o ORG -r REPO" >&2
				return 1 ;;
		esac
	done
	if [[ -z "${ORG}" ]]
	then
		echo "Organization is required."
		return 1
	fi
	if [[ -z "${REPO}" ]]
	then
		echo "Repository is required."
		return 1
	fi
	for id in $(gh run list -R "${ORG}"/"${REPO}" --limit 5000 --json databaseId,status | jq -r '.[] | select(.status == "queued" or .status == "in_progress") | .databaseId')
	do
		gh run cancel -R "${ORG}"/"${REPO}" "${id}"
		sleep 2
	done
}
