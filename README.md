# scripts
bash scripts for inclusion with bash alias files, .oh-my-zsh custom scripts, etc.

## TOC

- [**cwf**](#cwf)
- [**gclone**](#gclone)
- [**wtfis**](#wtfis)

## cwf

**CWF**: Cancel Workflows

Usage: `cwf -o ORG -r REPO`

This script will cancel all workflow runs for any `queued` or `in_progress`
workflows in the `https://github.com/${ORG}/${REPO}` repository

The script assumes you are logged in via `gh auth login`

## gclone

Usage: `gclone -o ORG -r REPO`

This script will perform a quick two-step process

1. clone the REPO repository from the ORG github organization
  a. clones to `./${REPO}`
  b. return `1` on failure to clone
2. navigate to the REPO
  a. `cd ${REPO}`
  b. return `1` on failure to change directory.

## wtfis

**wtfis**: Use cheat.sh to get a condensed summary of the tool specified

Usage: `wtfis TOOL`

*Note*: Requires internet connection

