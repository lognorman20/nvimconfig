# conda setup
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/logno/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/logno/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/logno/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/logno/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# nvm && node setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aliases
    # General
    alias b="cd .."
    alias bb="cd ../.."
	alias ls="gls --color"
    alias rm='rm -i -r' # prevents rm from being bad

	# ls when changing directories
	chpwd() ls


    # To folders
    alias ggithub="cd ~/Documents/work/github"
    alias gschool="cd ~/Documents/work/school/sophomore/spring/"
    alias gwork="cd ~/Documents/work/"
    alias gholonym="cd ~/Documents/work/career/holonym"
    alias gleetcode="cd ~/Documents/work/github/logcodegrind/problems"
    alias gviconfig="cd ~/.config/nvim/"


# fzf cheese, idek what this does bro
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
[[ ! -r /Users/logno/.opam/opam-init/init.zsh ]] || source /Users/logno/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="/usr/local/opt/openssl@1.0/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# vim mode in terminal
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
