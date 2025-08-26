#!/bin/zsh

alias clear='clear && printf "\\e[3J"'
alias cl='clear'
alias ll='ls -lh'
alias la='ls -lAh'
alias cppath='pwd|pbcopy'
alias cdf='cd; cd Documents/Code'
alias cdp='cdf; cd WorkshopCpp/CppSockets'
alias s='cdp; ./build/server_test'
alias c='cdp; ./build/client_test'
alias b='cdp; ./build.sh; s'
alias py='python3'
alias python='py'
alias m='cdf; cd Python/Workshop/PerlinNoise; py slidingPerlin.py'

alias upip='pip3 --verbose --log=/Users/loicpwlk/Documents/Code/Python/pipLogs/piplogs.log '

alias cdbm='cl; cd /Library/Frameworks/Python.framework/Versions/3.12/lib/python3.12; ls -Ah -S -l -r'
alias cdm='cl; cd /Library/Frameworks/Python.framework/Versions/3.12/lib/python3.12/site-packages/; ls -lAh -S -l -r'
alias cdv='cd; cd .vscode;'
alias cda='cd; cd Documents/Code/AetherStack'

alias cdi='cd; cd Documents/Code/itermAPI'
alias t='cdi; py it2mpexec.py'
alias rcol='py -m rich.color'
alias rthm='py -m rich.theme; py -m rich.default_styles'

# Zsh-related configuration file aliases 
alias z='zsh'
alias src0='source ~/.zsh_cfg/p10k.zsh'
alias src1='source ~/.zsh_cfg/p10k1.zsh'
alias zrc='code ~/.zsh_cfg'
alias ff='fastfetch'

alias tune='cdf; cd Python/Tools; py GuitarTuner.py'
alias sb='cdf; cd Python/Tools; py soundboard.py'


alias treef='tree -L 3 -ahp'
alias treed='tree -hp'

alias rdm='echo $((RANDOM%2+0))'

# Python tools

alias readme='py $HOME/Documents/Code/ReadmeEngine/readme-engine.py'

alias wl='py ~/.worklog/worklog.py'

alias kewcfg='code $HOME/Library/Preferences/kew/kewrc'

alias k='kew all'

alias cfg='code $ZSH_CFG && code $HOME/Library/Preferences/kew/kewrc'

# Git aliases

# alias gall='git add .'
# alias call='git commit -am'
# alias gc='git checkout'
# alias gb='git checkout -b'