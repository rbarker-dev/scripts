mvscript(){
    while getopts "s:d:n:zh" opt; do
        case $opt in
            s) SOURCE="${OPTARG}" ;;
            d) DEST="${OPTARG}" ;;
            n) NAME="${OPTARG}" ;;
            z) ZSH=1 ;;
            h) HELP=1 ;;
            *) echo "Usage: $0 -s SOURCE -d DEST -n SCRIPT_NAME -z -h" >&2; return 1 ;;
        esac
    done

    if [[ ${HELP} -eq 1 ]]; then
        echo -e "Usage: $0 -s SOURCE -d DEST -n SCRIPT_NAME -z"
        echo -e "\t-s SOURCE - the source directory where the script to copy is located"
        echo -e "\t-d DEST - the destination directory where the script wants to go"
        echo -e "\t-n NAME - the script to copy"
        echo -e "\n\t-z - Flag indicating we should move as a '*.zsh' file"
        echo -e "\t-h - Print this help message"
        return 0
    fi

    if [[ -z ${SOURCE} ]]; then
        echo "Copying from cwd"
        SOURCE=$(pwd)
    fi

    if [[ -z "${DEST}" ]] && [[ ${ZSH} -eq 1 ]]; then
        echo "Setting zsh path"
        DEST="${HOME}/.oh-my-zsh/custom/"
    elif [[ -z "${DEST}" ]]; then
        echo "DEST is required."
        return 1
    fi

    if [[ -z "${NAME}" ]]; then
        echo "SCRIPT_NAME is required."
        return 1
    fi

    if [[ ${ZSH} -eq 1 ]]; then
        cp "${SOURCE}/${NAME}" "${DEST}/${NAME%.sh}.zsh" || { echo "Error copying ${SOURCE}/${NAME}"; return 1; }
        echo "Moved ${SOURCE}/${NAME} to ${DEST}/${NAME%.sh}.zsh"
    else
        cp "${SOURCE}/${NAME}" "${DEST}/${NAME}" || { echo "Error copying ${SOURCE}/${NAME}"; return 1; }
        echo "Moved ${SOURCE}/${NAME} to ${DEST}/${NAME}"
    fi
}

