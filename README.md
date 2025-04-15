# scripts
bash scripts for inclusion with bash alias files, .oh-my-zsh custom scripts, etc.

## TOC

- [**add2bashrc**](#add2bashrc)
- [**cwf**](#cwf)
- [**gclone**](#gclone)
- [**mv2zsh**](#mv2zsh)
- [**wtfis**](#wtfis)

## add2bashrc

**add2bashrc**: Add scripts to `~/.custom_scripts` and include in path

Usage: `./add2bashrc`

This script copies cwf.sh, gclone, and wtfis to `~/.custom_scripts` and
adds `~/.custom_scripts` to your `${PATH`} environment

## cwf

**CWF**: Cancel Workflows

Usage: `cwf -o ORG -r REPO`

This script will cancel all workflow runs for any `queued` or `in_progress`
workflows in the `https://github.com/${ORG}/${REPO}` repository

The script assumes you are logged in via `gh auth login`

## gclone

**GCLONE**: git clone (and cd)

Usage: `gclone -o ORG -r REPO`

This script will perform a quick two-step process

1. clone the REPO repository from the ORG github organization
  a. clones to `./${REPO}`
  b. return `1` on failure to clone
2. navigate to the REPO
  a. `cd ${REPO}`
  b. return `1` on failure to change directory.

## mv2zsh

**mv2zsh**: Move scripts to ~/.oh-my-zsh/custom

Usage: `./mv2zsh`

Moves the cwf.sh, gclone.sh, and wtfis.sh scripts to `~/.oh-my-zsh/custom` and
encourages the user to restart `zsh` to pick up changes

## wtfis

**WTFIS**: Use cheat.sh to get a condensed summary of the tool specified

Usage: `wtfis TOOL`

*Note*: Requires internet connection

