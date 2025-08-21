#!/bin/zsh

# Config-related environment variables exports
export ZSH_CFG="$HOME/.zsh_cfg"
export LOG_FILE="$HOME/.zsh_cfg/zlogs.log"

# External environment variables exports
export ZSH="$HOME/.oh-my-zsh"
export CLICOLOR=1
export ZSH_THEME="powerlevel10k/powerlevel10k"

clear && printf "\\e[3J" 

source $ZSH_CFG/cfg/sourcing.zsh

fastfetch --config $(parseCfg fastfetch.config_path)

# test_arr_1=(
#     "echo ez"
#     "echo ezdeouf"
# )

# test_arr_2=(
#     "ech t ez"
#     "echo t ezdeouf"
# )

# echo ____run_test_matrix_____________________________________________________________________________________________ && echo
# run_test_matrix test_arr_1 test_arr_2
# echo ____run_test_array______________________________________________________________________________________________ && echo
# run_test_array test_arr_1
# echo ____run_test____________________________________________________________________________________________________ && echo
# run_test "echo ez"

# run_test_matrix test_levels test_timestamps test_levels_modes test_output_toggles test_context_toggles test_logfiles test_combinations test_edge_cases

function fastFetchHotReload() {
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

# OMZ & p10k settings

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    themes 
    colored-man-pages
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e $ZSH/oh-my-zsh.sh && source $ZSH/oh-my-zsh.sh

test -e $ZSH_CFG/cfg/p10k/p10k.zsh && source $ZSH_CFG/cfg/p10k/p10k.zsh
