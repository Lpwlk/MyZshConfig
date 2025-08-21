# DARK_MAGENTA=$(rgb 120 30 170)

run_test() {

    local embedded=false
    local cmds=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h) embedded=$(! $embedded); shift ;;
            --) shift; break ;;
            -*) echo "Unknown option: $1"; return 1 ;;
            *) break ;;
        esac
    done

    if [[ $print_header ]]; then 
        log TEST -fi " Running test on: $RESET$ITALIC$1$RESET"
    fi

    echo -n "Output > $RESET"
    eval "$1"
    local ret=$?


    if $print_footer; then
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

    local print_header=true
    local print_footer=true
    local cmds=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h) print_header=$(! $print_header); shift ;;
            -f) print_footer=$(! $print_footer); shift ;;
            --) shift; break ;;
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
    local total_tests=0
    log TEST -fi "󰙨 Running group of test sections ...$RESET"

    for test_name in "$@"; do
        eval "current_tests=(\"\${${test_name}[@]}\")"
        local num_tests=${#current_tests[@]}

        echo
        echo "  󰙨 Running test section: $BOLD$test_name$RESET $DIM($num_tests tests)$RESET"
        run_test_array "${current_tests[@]}"
        local ret=$?
        (( total_passed += num_tests - ret ))
        (( total_failed += ret ))
        (( total_tests += num_tests ))
    done
    print_footer=true
    if [[ $print_footer ]]; then
        echo "Matrix test summary:"
        echo "    ├── Total :  $total_tests$RESET"
        echo "    ├── Passed:  $total_passed$RESET"
        echo "    └── Failed:  $total_failed$RESET"
        echo
    fi

    return $total_failed
}

# -------- Tests Definitions ---------

test_help=(
    "log --help"
)

test_levels=(
    "log DBG 'Debug message at DBG level'"
    "log INFO 'Informational message at INFO level'"
    "log WARN 'Warning message at WARN level'"
    "log ERR 'Error message at ERR level'"
    "log 'Message with no explicit level (NONE)'"
)

test_timestamp=(
    "log INFO --timestamp none 'Timestamp disabled (none)'"
    "log INFO --timestamp time 'Timestamp with time only (HH:MM:SS)'"
    "log INFO --timestamp date 'Timestamp with date only (YYYY-MM-DD)'"
    "log INFO --timestamp full 'Timestamp with full date & time (YYYY-MM-DD HH:MM:SS)'"
)

test_logfile=(
    "log INFO --logfile /tmp/test_log.log 'Logging to /tmp/test_log.log file'"
    "log WARN -f /tmp/test_log_warn.log 'Logging warning to /tmp/test_log_warn.log file'"
)

test_stdout_file_toggle=(
    "log INFO --stdout 'Toggle stdout off (first call)'"
    "log INFO --stdout 'Toggle stdout on (second call)'"
    "log INFO --no-console 'Disable stdout output explicitly'"
    "log INFO --console 'Enable stdout output explicitly'"
    "log INFO --file 'Toggle file output off (first call)'"
    "log INFO --file 'Toggle file output on (second call)'"
    "log INFO --no-file 'Disable file output explicitly'"
    "log INFO --file 'Enable file output explicitly'"
)

test_filename_funcname_toggle=(
    "log INFO --filename 'Toggle filename display off/on'"
    "log INFO --filename 'Toggle filename display again'"
    "log INFO --funcname 'Toggle function name display off/on'"
    "log INFO --funcname 'Toggle function name display again'"
)

test_combinations=(
    "log WARN --timestamp full --no-console --logfile /tmp/combined.log -fi -fn 'Combined options test with full timestamp, no stdout, custom logfile, filename and funcname toggled'"
    "log ERR --no-file --no-console 'No output anywhere (file and stdout disabled)'"
    "log DBG --timestamp none --stdout --file 'Debug message, timestamp none, stdout and file enabled'"
    "log INFO -fi -fn -so -fo 'All toggles short flags combined'"
    "log 'Message with no level and default options (timestamp time, stdout/file on)'"
    "log ERR -so -fo 'Error with toggled outputs (stdout and file toggled)'"
    "log WARN --logfile /tmp/test.log 'Warning with custom logfile /tmp/test.log'"
    "log INFO 'Testing special chars: äöü ß € © ✓'"
)

test_edge_cases=(
    "log 'Empty message test (no level, default options)'"
    "log -fi -fn 'Filename and funcname only message toggled off/on'"
    "log --timestamp unknown 'Unknown timestamp mode, fallback to time'"
    "log ERR --logfile '' 'Empty logfile path, fallback to default'"
    "log --timestamp none -fi 'Timestamp none with filename toggled off/on'"
    "log --stdout --file 'Explicit enable outputs (stdout and file)'"
)
