#!/bin/zsh

function fastFetchHotReload {
    # echo "=== Available Logos ==="
    # logos=$(fastfetch --list-logos | awk '{print $2}')
    # echo "$logos" | while read -r logo; do
    #     echo -e "\n--- $logo ---"
    #     logo=$(echo "$logo" | tr -d '"')
    #     echo fastfetch --logo $logo
    #     fastfetch --logo $logo
    #     # sleep 0.5
    # done

    echo "\n\n=== Available Modules ==="
    mods=$(ff --list-modules | awk -F':| ' '{print $2}' | paste -sd' ' -)
    echo "ff --structure $mods"
    ff --structure $mods
}

function cmap {
    var=${1:-6}
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%var)):#3}:+$'\n'}; done
}

function donut {
    cdf; cd Python/Exercices; clear; py donut.py -s35; 
}

function getmp3 {
    path="$HOME/Music/MusicLib"
    mkdir -p $path
    yt-dlp $@ -t mp3 -o "$HOME/Music/MusicLib"
}

function ff-hot-reload {
    local config="${1:-$ZSH_CFG/cfg/fastfetch/config.jsonc}"
    if [[ ! -f "$config" ]]; then
        echo "Config introuvable : $config"
        return 1
    fi
    echo "Sniffing $config file updates ... (Ctrl+C to quit)"

    while true; do
        clear
        fastfetch --config "$config"

        if command -v inotifywait &>/dev/null; then                 # Linux (inotifywait)
            inotifywait -q -e modify "$config" >/dev/null
        elif command -v fswatch &>/dev/null; then                   # macOS (fswatch)
            fswatch -1 "$config" >/dev/null
        else
            echo "Error: Didnt found any 'inotifywait' nor 'fswatch' executable"
            return 1
        fi
    done
}