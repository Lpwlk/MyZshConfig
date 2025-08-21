#!/bin/zsh

ff_show_all_logos_and_modules() {
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

function cmap() {
    var=${1:-6}
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%var)):#3}:+$'\n'}; done
}

function donut {
    cdf; cd Python/Exercices; clear; py donut.py -s35; 
}

getmp3() {
    path="$HOME/Music/MusicLib"
    mkdir -p $path
    yt-dlp $@ -t mp3 -o "$HOME/Music/MusicLib"
}
