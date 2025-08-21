#!/bin/zsh

# A true masterpiece of garbage shell scripting

echoLpwlkLogo() {
    local indent_cnt=0
    local padding_cnt=0
    local fade_index=0
    local center_logo=false
    local trace_box=false
    local bpadding_cnt=0
    local box_color=$WHITE

    local TL="╭" TR="╮" BL="╰" BR="╯" HL="─" VL="│"

    while [[ $# -gt 0 ]]; do
        case "$1" in
        -b|--box         )  trace_box=true;     shift 1;;
        -c|--center      )  center_logo=true;   shift 1;;
        -i|--indent      )  indent_cnt=$2;      shift 2;;
        -p|--padding     )  padding_cnt=$2;     shift 2;;
        -f|--fade        )  fade_index=$2;      shift 2;;
        -bp|--boxpadding )  bpadding_cnt=$2;    shift 2;;
        -bc|--boxcolor   )  box_color=$2;       shift 2;;   
        *)
            echo "Unknown option : $1"
            return 1
            ;;
        esac
    done

    local logo_width=59

    if [[ "$trace_box" == false ]]; then
        VL=''; bpadding_cnt=0
    fi

    if [[ "$center_logo" == true ]]; then
        local term_width=$(tput cols)
        local total_width=$(( $logo_width + 6 * $bpadding_cnt + 2 ))
        indent_cnt=$(( ($term_width - total_width) / 2 ))
        (( indent_cnt < 0 )) && indent_cnt=0
    elif [[ $padding_cnt -gt 0 ]]; then
        indent_cnt=$padding_cnt
    fi

    local INDENT=$(printf '%*s' "$indent_cnt" '')
    local BOX_INDENT=$(printf '%*s' $((3 * $bpadding_cnt)) '')

    case "$fade_index" in
        0) FADE=("${PASTEL_RAINBOW[@]:0:5}") ;;
        1) FADE=("${PASTEL_BLUE_RAINBOW[@]:0:5}") ;;
        2) FADE=("${PASTEL_GREEN_RAINBOW[@]:0:5}") ;;
        3) FADE=("${PASTEL_GREEN_YELLOW[@]:0:5}") ;;
        4) FADE=("${PASTEL_ORANGE_RAINBOW[@]:0:5}") ;;
        5) FADE=("${PASTEL_YELLOW_RAINBOW[@]:0:5}") ;;
        6) FADE=("${PASTEL_MAGENTA_RAINBOW[@]:0:5}") ;;
        7) FADE=("${PASTEL_GREY_RAINBOW[@]:0:5}") ;;
        8) FADE=("${PASTEL_RED_RAINBOW[@]:0:5}") ;;
    esac

    local BCOLOR="$box_color"
    
    for ((i=0; i < padding_cnt; i++)); do printf '\n'; done

    if [[ "$trace_box" == true ]]; then
        printf '%s%s%s' $INDENT $BCOLOR $TL
        printf '%*s' $(($logo_width + 6 * $bpadding_cnt)) '' | tr ' ' $HL
        printf '%s\n' $TR
        for ((i=0; i < $bpadding_cnt; i++)); do
            printf '%s%s%s%*s%s\n' "$INDENT" "$BCOLOR" "$VL" $(($logo_width + 6 * $bpadding_cnt)) '' "$VL"
        done
    fi                               
                                                          
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s ___     %s  ________ %s ___       ___%s  ___      %s ___  ___     %s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s|\  \     %s|\   __  \%s|\  \     |\  \%s|\  \     %s|\  \|\  \    %s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s\ \  \    %s\ \  \|\  \ %s\  \    \ \  \%s \  \    %s\ \  \/  /_   %s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s \ \  \    %s\ \   ____\ %s\  \  __\ \  \%s \  \    %s\ \   __  \  %s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s  \ \  \____%s\ \  \___|%s\ \  \|\__\_\  \%s \  \____%s\ \  \ \  \ %s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s   \ \______\%s\ \__\    %s\ \____________\%s \_______%s\ \__\ \__\%s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL
    printf "$INDENT$BCOLOR$VL$BOX_INDENT%s    \|_______|%s\|__|     %s\|____________|%s\|_______|%s\|__|\|__|%s%s%s\n" $FADE $BOX_INDENT $BCOLOR $VL

    if [[ "$trace_box" == true ]]; then
        for ((i=0; i < $bpadding_cnt; i++)); do
            printf '%s%s%s%*s%s\n' "$INDENT" "$BCOLOR" "$VL" $(($logo_width + 6 * $bpadding_cnt)) '' "$VL"
        done
        printf '%s%s%s' $INDENT $BCOLOR $BL
        printf '%*s' $(($logo_width + 6 * $bpadding_cnt)) '' | tr ' ' $HL
        printf '%s\n' $BR
    fi

    for ((i=0; i < padding_cnt; i++)); do printf '\n'; done
}

lpwlkLogo() {
    LOGO_OPTS=(
        --indent 12
        --center
        --padding 0
        --fade 3
        --box
        --boxpadding 1
        --boxcolor "$(rgb 200 240 170)"
    )

    echoLpwlkLogo "${LOGO_OPTS[@]}"
}

# indents=(0 4 8)
# paddings=(0 1 2)
# boxpaddings=(0 1 )
# centers=(true false)
# boxes=(true false)

# for center in "${centers[@]}"; do
#   for box in "${boxes[@]}"; do
#     for indent in "${indents[@]}"; do
#       for padding in "${paddings[@]}"; do
#         for boxpadding in "${boxpaddings[@]}"; do
#           msg="Test: center=$center, box=$box, indent=$indent, padding=$padding, boxpadding=$boxpadding"

#           if [[ "$center" == "true" ]]; then
#             term_width=$(tput cols)
#             msg_width=${#msg}
#             indent_width=$(( ($term_width - $msg_width) / 2 ))
#             (( indent_width < 0 )) && indent_width=0

#             printf '%*s' "$indent_width" ''
#             echo "----------------------------------------------------------------"

#             printf '%*s' "$indent_width" ''
#             echo "$msg"
#           else
#             total_offset=$(( $indent + 1 * padding ))

#             printf '%*s' "$total_offset" ''
#             echo "----------------------------------------------------------------"

#             printf '%*s' "$total_offset" ''
#             echo "$msg"
#           fi

#           args=(
#             --indent "$indent"
#             --padding "$padding"
#             --boxpadding "$boxpadding"
#           )
#           [[ "$center" == "true" ]] && args+=(--center)
#           [[ "$box" == "true" ]] && args+=(--box)

#           echoLpwlkLogo "${args[@]}"
#           sleep 0.1
#         done
#       done
#     done
#   done
# done
