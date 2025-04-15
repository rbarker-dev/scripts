gclone () {
	while getopts "o:r:" opt
	do
		case $opt in
			(o) ORG="${OPTARG}"  ;;
			(r) REPO="${OPTARG}"  ;;
			(*) echo "Usage: $0 -o ORG -r REPO" >&2
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
		echo "Repository name is required."
		return 1
	fi
	echo "Cloning git@github.com:${ORG}/${REPO}.git"
	if git clone git@github.com:"${ORG}"/"${REPO}".git
	then
		cd "${REPO}" || {
			echo "Failed to cd into ${REPO}" >&2
			return 1
		}
	else
		echo "git clone failed for ${ORG}/${REPO}" >&2
	fi
}
