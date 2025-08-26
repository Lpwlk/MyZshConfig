# DARK_MAGENTA=$(rgb 120 30 170)

run_test() {

    local array_mbed=false
    local cmds=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -m) array_mbed=$(! $array_mbed); shift ;;
            -*) echo "Unknown option: $1"; return 1 ;;
            *) break ;;
        esac
    done

    if [[ $array_mbed ]]; then 
        log TEST -fi "Running test on: $RESET$ITALIC$1$RESET"
    fi

    echo -n "Output > $RESET"
    eval "$1"
    local ret=$?


    if $array_mbed; then
        echo "Test summary$RESET"
        if [[ $ret -eq 0 ]]; then
            echo "  └── Result:$RESET $GREEN 󰄬 Passed$RESET"
        else
            echo "  └── Result:$RESET - $RED  Failed (exit code: $ret)$RESET"
        fi
        echo
    fi

    return $ret
}

run_test_array() {

    local matrix_mbed=false
    local cmds=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -m) matrix_mbed=$(! $matrix_mbed); shift ;;
            -*) echo "Unknown option: $1"; return 1 ;;
            *) break ;;
        esac
    done

    if [[ $# -eq 1 ]] && eval "[[ \${$1+x} ]]"; then
        local arr_name="$1"
        eval "cmds=(\"\${${arr_name}[@]}\")"
    else
        cmds=("$@")
    fi

    local total=${#cmds[@]}
    local passed=0
    local failed=0

    if [[ $print_footer ]]; then
        log TEST -fi "Running $total tests...$RESET"
    fi

    for cmd in "${cmds[@]}"; do

        run_test "$cmd"
        local ret=$?

        if (( ret == 0 )); then ((passed++)) else ((failed++)) fi    
    done

    if [[ $print_footer ]]; then
        echo "Array test summary:"
        echo "      ├── Total :  $total$RESET"
        echo "      ├── Passed:  $passed$RESET"
        echo "      └── Failed:  $failed$RESET"
        echo
    fi

    return $failed
}

run_test_matrix() {
 
    local total_passed=0
    local total_failed=0
    local num_tests
    log TEST -fi "󰙨 Running group of test sections ...$RESET"

    for test_name in "$@"; do
        eval "current_tests=(\"\${${test_name}[@]}\")"
        num_tests=${#current_tests[@]}

        echo
        echo "  󰙨 Running test section: $BOLD$test_name$RESET $DIM($num_tests tests)$RESET"
        run_test_array "${current_tests[@]}"
        local ret=$?
        (( total_passed += num_tests - ret ))
        (( total_failed += ret ))
        (( total_tests += num_tests ))
    done

    if [[ $embedded ]]; then
        echo "Matrix test summary:"
        echo "    ├── Total : $total_tests$RESET"
        echo "    ├── Passed: $total_passed$RESET"
        echo "    └── Failed: $total_failed$RESET"
        echo
    fi

    return $total_failed
}

# -------- Tests Definitions ---------
# -- Basic levels
test_levels=(
    "log ZSH 'This is a ZSH message'"
    "log TEST 'This is a TEST message'"
    "log DBG 'This is a DEBUG message'"
    "log INFO 'This is an INFO message'"
    "log WARN 'This is a WARNING message'"
    "log ERR 'This is an ERROR message'"
    "log 'Message with no explicit level (NONE)'"
)

# -- Timestamp modes
test_timestamps=(
    "log INFO -t none 'Timestamp disabled'"
    "log INFO -t time 'Timestamp (time only)'"
    "log INFO -t date 'Timestamp (date only)'"
    "log INFO -t full 'Timestamp (full date+time)'"
)

# -- Level modes
test_levels_modes=(
    "log INFO -l none 'No level indicator'"
    "log INFO -l level 'Level name only'"
    "log INFO -l icon 'Icon only'"
    "log INFO -l full 'Icon + level name'"
)

# -- Stdout/File toggles
test_output_toggles=(
    "log INFO -so 'Toggle stdout (first call → disable)'"
    "log INFO -so 'Toggle stdout (second call → enable)'"
    "log INFO -fo 'Toggle file (first call → disable)'"
    "log INFO -fo 'Toggle file (second call → enable)'"
)

# -- Filename/Funcname toggles
test_context_toggles=(
    "log INFO -fi 'Toggle filename (first call → disable)'"
    "log INFO -fi 'Toggle filename (second call → enable)'"
    "log INFO -fn 'Toggle funcname (first call → disable)'"
    "log INFO -fn 'Toggle funcname (second call → enable)'"
)

# -- Custom logfile
test_logfiles=(
    "log INFO -f /tmp/logger_test1.log 'Log written to custom logfile 1'"
    "log WARN --logfile /tmp/logger_test2.log 'Log written to custom logfile 2'"
)

# -- Combinations
test_combinations=(
    "log WARN -t full -l icon -fo -fi -fn 'Warning with full ts, icon only, file disabled, context toggled'"
    "log ERR -t time -l level -so -fo 'Error with level name only, both stdout and file toggled'"
    "log DBG -t none -l none 'Debug with no timestamp and no level indicator'"
)

# -- Edge cases
test_edge_cases=(
    "log 'Empty message with defaults'"
    "log INFO '' 'Message argument empty'"
    "log UNKNOWN 'Unknown log level (should fallback)'"
    "log INFO -f '' 'Empty logfile path should fallback to default'"
)