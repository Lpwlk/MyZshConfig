# Emplacements
CONFIG_FILE="$ZSH_CFG/cfg/zshrcConfig.jsonc"
CONFIG_SCHEMA="$ZSH_CFG/cfg/zshrcConfig.sch.jsonc"

typeset -gA CONFIG

loadCfg() {

    if [[ ! -f "$CONFIG_FILE" ]]; then
        echo "Config file not found at $CONFIG_FILE" >&2
        return 1
    fi

    if ! validateCfg; then
        echo "Config load cancelled: JSON schema coudln't be validated." >&2
        return 1
    fi

    CONFIG=()
    
    while IFS== read -r key value; do
        CONFIG[$key]="$value"

    done < <(
        sed -E 's,//.*$,,; s,/[*].*[*]/,,g' "$CONFIG_FILE" | 
        jq -r 'paths(scalars) as $p |
            [($p | join(".")), (getpath($p))] |
            "\(.[0])=\(.[1])"'
    )

}

getKey() {
    local key="$1"
    echo "${CONFIG[$key]}"
}

validateCfg() {
    if ! ajv validate -s "$CONFIG_SCHEMA" -d "$CONFIG_FILE" --spec=draft7 --strict=false \
         1>/dev/null \
         2> >(grep -v 'unknown format "color" ignored' >&2); then
        log ERR "Config file doesn't match JSON schema $CONFIG_SCHEMA" >&2
        return 1
    fi
    return 0
}

parseAnsi() {
    local name=$1
    local ansi_str=""

    if [[ "$name" == \#* ]]; then
        local hex=${name#"#"}
        local r=$((16#${hex[1,2]}))
        local g=$((16#${hex[3,4]}))
        local b=$((16#${hex[5,6]}))
        ansi_str=$(rgb $r $g $b)
        # ansi_str=${"\e[38;2;%d;%d;%dm" "$r" "$g" "$b"}
    else
        local parts=(${(s:+:)name})
        for part in $parts; do
            local pname="${(U)part}"
            if [[ "$pname" == "NONE" ]]; then
                continue
            else
                ansi_str+="${(P)pname}"
            fi
        done
    fi
    print -r -- "$ansi_str"
}

parseBool() {
    local val="$1"
    case "$val" in
        true|True|1)  return 0 ;;
        false|False|0) return 1 ;;
        *) return 1 ;;
    esac
}

parseStr() {
    local val="$1"
    print -r -- "$val"

}

parsePath() {
    local path="$1"
    path="${path/#\~/$HOME}"
    path=$(print -P "$path")
    print -r -- "$ZSH_CFG/$path"
}

parseCfg() {
    local key="$1"
    local val="${CONFIG[$key]}"
    
    case "$key" in
        # Keys ending with "colors"/"style" are ANSI sequences
        *.color|*.style)
            parseAnsi "$val" ;;
        # Keys ending with "___" are Booleans
        *.echologo|*.sourcep10k|*.echofastfetch|*.listDirs|*.listFiles)
            parseBool "$val" ;;
        # Keys ending with "path" are pathes
        *.config_path)
            parsePath "$val" ;;
        # Keys ending with anything else are basic strings
        *)
            parseStr "$val" ;;
    esac
}

loadCfg
