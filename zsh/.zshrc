# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#source ~/.bashrc

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/home/atmosu/.local/bin:~/CWP/44R26/bin:$PATH
export PATH=/home/atmosu/RSFSRC/user/cumtb/build:~/CWP/44R26/bin:$PATH
source /home/atmosu/RSFSRC/env.sh 

#export DISPLAY=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`:0
export CWPROOT=~/CWP/44R26
export CBLASROOT=/home/atmosu/temp/lapack-3.10.1/CBLAS/include/
export LIBRARY_PATH=$LIBRARY_PATH:/home/atmosu/temp/lapack-3.10.1:/home/atmosu/RSFROOT/
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/atmosu/temp/lapack-3.10.1/LAPACKE/include:/home/atmosu/temp/lapack-3.10.1/CBLAS/include:/home/atmosu/RSFROOT/include
export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH
# if [ -n "$C_INCLUDE_PATH" ]; then
# export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/atmosu/temp/lapack-3.10.1/LAPACKE/include:/home/atmosu/temp/lapack-3.10.1/CBLAS/include:/home/atmosu/RSFROOT/include
# else
# export C_INCLUDE_PATH=/home/atmosu/temp/lapack-3.10.1/LAPACKE/include:/home/atmosu/temp/lapack-3.10.1/CBLAS/include:/home/atmosu/RSFROOT/include
# fi




# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lukerandall"
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (cat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
export FZF_COMPLETION_TRIGGER='\'
# Set list of themes to pick from when loading at random

# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  timer
)

source $ZSH/oh-my-zsh.sh

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
alias ja='joshuto'
alias vim='lvim'
alias vi='lvim'
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias lf='$HOME/apps/lf'
alias oh='explorer.exe .' 
alias zz='z -' 
alias lg='lazygit' 

#alias python='python3'

# -----------------auto suggestions-

(( ! ${+ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS
	ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    vi-forward-blank-word-end
    forward-word
	)
}


function __smart_completion() {
  if [ -n "$POSTDISPLAY" ]; then
    zle autosuggest-accept
  else
    zle expand-or-complete
  fi
}

zle -N __smart_completion
bindkey '\t' __smart_completion
bindkey "^l" vi-forward-blank-word-end

function __smart_backward() {
  if [ -n "$POSTDISPLAY" ]; then
    zle autosuggest-clear
  else
    zle backward-delete-char
  fi
}

zle -N __smart_backward
bindkey '^H' __smart_backward


eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path for shared object files
if [ -n "$LD_LIBRARY_PATH" ]; then
export LD_LIBRARY_PATH=/home/atmosu/temp/:${LD_LIBRARY_PATH}
else
export LD_LIBRARY_PATH=/home/atmosu/temp
fi

export PYTHONPATH=/home/atmosu/RSFSRC/book/Recipes:$PYTHONPATH
source "$HOME/.cargo/env"
