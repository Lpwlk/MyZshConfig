#!/bin/zsh

dbg() {
    echo $1 >> $ZSH_CFG/.dump/dbg.txt
}

sourceZshDir() {
    local unit="ms"
    local sleep_time=0
    local folder=$ZSH_CFG
    local exclude=""

    while getopts "u:s:d:e:" opt; do
        case $opt in
            u) unit="$OPTARG"       ;;
            s) sleep_time="$OPTARG" ;;
            d) folder="$OPTARG"     ;;
            e) exclude="$OPTARG"    ;;
            *)
                echo "Usage: sourceZshDir -u <unit> -s <sleep> -d <folder> [-e <exclude>]"
                return 1
                ;;
        esac
    done

    if [[ "$unit" == "µs" || "$unit" == "us" ]]; then 
        suffix="µs"; timediv=1000
    else 
        suffix="ms"; timediv=1000000
    fi  

    start=$(date +%s%N)
    log ZSH "  Sourcing $DIM${folder:h}/$RESET${folder:t} directory..."

    find $folder -type f -name "*.zsh" ! -path "$ZSH_CFG$exclude" | while read -r file; do
        sstart=$(date +%s%N)
        test -e $file && source $file
        elapsed=$(($(($(date +%s%N) - sstart)) / timediv))
        echo "    ${file:t} sourcing done (󱦟 ${elapsed} ${suffix})"
        sleep $sleep_time
    done
    elapsed=$(($(($(date +%s%N) - start)) / timediv))
    log ZSH "    $folder sourcing done (󱦟 ${elapsed} ${suffix})"
}

sourceZshCfg() {
    source $ZSH_CFG/lib/ansi.zsh 
    source $ZSH_CFG/lib/config.zsh 
    source $ZSH_CFG/lib/logger.zsh
    sourceZshDir -u ms -s 0.01 -d $ZSH_CFG/lib
    sourceZshDir -u ms -s 0.01 -d $ZSH_CFG/src/utils
    sourceZshDir -u ms -s 0.01 -d $ZSH_CFG/src/core -e /src/core/zshrc.zsh
}

sourceZshCfg