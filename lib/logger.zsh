#!/bin/zsh

LOG_LEVELS=(
    "NONE"
    "DBG"
    "INFO"
    "ZSH"
    "TEST"
    "WARN"
    "ERR"
)

checkLogLevel() {
    for l in ${LOG_LEVELS[@]}; do
        [[ $l == $1 ]] && return 0
    done
    echo "[ERROR] Invalid log level: '$1'\n        Available levels: ${LOG_LEVELS[*]}" >&2
    return 1
}

LOG_LEVEL=""

setLogLevel() {
    if checkLogLevel $1; then
        LOG_LEVEL=$1 && return 0
    fi
    return 1
}

setLogLevel DBG

checkPriority() {
    local level=$1
    local priority=$2
    local min_priority

    case $level in
        ZSH|TEST|DBG) min_priority=1 ;;
        INFO)         min_priority=2 ;;
        WARN)         min_priority=3 ;;
        ERR)          min_priority=4 ;;
        *)            min_priority=1 ;;
    esac

    [[ $priority -lt $min_priority ]] && return 1 || return 0
}

logHelp() {
    cat << EOF
$YELLOW
──────────────────────────────────────── Zsh logger help  ────────────────────────────────────────
$RESET
$YELLOW > Usage:$RESET log [LEVEL] [OPTIONS] MESSAGE

Description: This logger is designed to keep track of my zsh scripts executions via stdout and/or a 
specified logfile. The console output colors may be tweaked using the cfg/zshrcConfig.jsonc config 
file. The config file documentation about can be found in cfg/CONFIG.md if needed.

$YELLOW > Log levels:$RESET
    ZSH         Zsh cfg message
    TEST        Test message
    DBG         Debug message
    INFO        Informational message
    WARN        Warning message
    ERR         Error message
    NONE        Loglevel unset

$YELLOW > Options:$RESET                    Description                         $DIM Default $RESET
    -h | --help             Show this help message and return   $DIM false $RESET
    -f | --logfile PATH     Specify alternative log file        $DIM $LOG_FILE $RESET
    -t | --timestamp MODE   Timestamp format                    $DIM time $RESET
                                n | none  →  No timestamp
                                t | time  →  HH:MM:SS (default)
                                d | date  →  YYYY-MM-DD
                                f | full  →  YYYY-MM-DD HH:MM:SS
    -l | --level MODE       Level format                        $DIM full $RESET
                                n | none  →  No logo/icon
                                l | level →  level name only
                                i | icon  →  level icon only
                                f | full  →  level name + icon
    -so | --stdout          Toggle stdout output                $DIM true $RESET
    -fo | --file            Toggle file output                  $DIM true $RESET
    -fi | --filename        Toggle filename in log message      $DIM true $RESET
    -fn | --funcname        Toggle function name in log message $DIM true $RESET
    -li | --light           Light stdout display                $DIM false $RESET

$YELLOW > Examples:$RESET
    log INFO --timestamp datetime "Info message with full timestamp"
    log WARN --stdout "Warning message without stdout output"
EOF
}

log() {

    local message_parts=()
    local priority min_priority

    local timestamp_str=""
    local timestamp_mode="time"

    local icon=""
    local level=""
    local level_str=""
    local level_mode="full"

    local stdout_msg file_msg
    
    # Default output flags (enabled)
    local to_stdout=true
    local to_logfile=true
    local logfile=$LOG_FILE

    local show_filename=true
    local show_funcname=true

    local timestampStyle=$(parseCfg logger.timestamp.color)$(parseCfg logger.timestamp.style)
    local filenameStyle=$(parseCfg logger.filename.color)$(parseCfg logger.filename.style)
    local funcnameStyle=$(parseCfg logger.funcname.color)$(parseCfg logger.funcname.style)
    local messageStyle=$(parseCfg logger.message.color)$(parseCfg logger.message.style)
    local levelStyle levelIcon
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                logHelp; return 0 ;;
            (${~${(j:|:)LOG_LEVELS}}))
                level="$1"; shift ;;
            -f|--logfile)
                logfile="$2"; shift 2 ;;
            -l|--level)
                level_mode="$2"; shift 2 ;;
            -t|--timestamp)
                timestamp_mode="$2"; shift 2 ;;
            -so|--stdout)
                to_stdout=$(! $to_stdout); shift ;;
            -fo|--file)
                to_logfile=$(! $to_logfile); shift ;;
            -fi|--filename)
                show_filename=$(! $show_filename); shift ;;
            -fn|--funcname)
                show_funcname=$(! $show_funcname); shift ;;
            -li|--light)
                level_mode=full; 
                timestamp_mode=time;
                show_filename=true; 
                show_funcname=false; 
                shift ;;
            *)
                message_parts+=("$1"); shift ;;
        esac
    done

    [[ -z $level ]] && level="NONE"

    priority=$(parseCfg logger.level.${level:l}.priority)

    checkPriority $LOG_LEVEL $priority || return

    local message="$messageStyle${(j: :)message_parts}"

    case "$timestamp_mode" in
        n|none) timestamp_str="$RESET" ;;
        t|time) timestamp_str="${timestampStyle}$(date +"%H:%M:%S")$RESET" ;;
        d|date) timestamp_str="${timestampStyle}$(date +"%Y-%m-%d")$RESET" ;;
        f|full) timestamp_str="${timestampStyle}$(date +"%Y-%m-%d %H:%M:%S")$RESET" ;;
        *) timestamp_str="${timestampStyle}$(date +"%H:%M:%S")$RESET" ;;
    esac

    
    levelStyle=$(parseCfg logger.level.${level:l}.color)$(parseCfg logger.level.${level:l}.style)
    levelIcon=$(parseCfg logger.level.${level:l}.icon)

    case "$level_mode" in
        n|none)  level_str="$RESET" ;;
        l|level) level_str="${levelStyle}${level:+$level }─$RESET" ;;
        i|icon)  level_str="${levelStyle}${levelIcon:+$levelIcon }─$RESET" ;;
        f|full)  level_str="${levelStyle}${levelIcon:+$levelIcon }${level:+$level }─$RESET";;
        *)       level_str="${levelStyle}${levelIcon:+$levelIcon }${level:+$level }─$RESET";;
    esac

    local context_str="$RESET"
    [[ $show_filename == true ]] && context_str="[${filenameStyle}$(basename ${funcfiletrace[1]%:*})$RESET]"
    [[ $show_funcname == true ]] && context_str="[${funcnameStyle}${funcstack[2]:-main}$RESET]"
    [[ $show_filename == true && $show_funcname == true ]] && context_str="[${filenameStyle}$(basename ${funcfiletrace[1]%:*})$RESET → ${funcnameStyle}${funcstack[2]:-main}$RESET]"

    if $to_stdout; then
        local stdout_msg="${timestamp_str:+$timestamp_str }${context_str:+$context_str }${level_str:+$level_str }$messageStyle$message$RESET"
        if ! printf "%s\n" "$stdout_msg"; then
            return 1
        fi
    fi

    if $to_logfile; then
        local file_msg="$(date +"%Y-%m-%d %H:%M:%S") [$(basename ${funcfiletrace[1]%:*}) → ${funcstack[2]:-main}] ${icon:+$icon }${level:+$level }─ $message"
        if ! printf "%s\n" "$file_msg" | sed -r 's/\x1B\[[0-9;]*[JKmsu]//g' >> "$logfile"; then
            return 2
        fi
    fi
}