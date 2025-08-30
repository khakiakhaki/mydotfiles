
# ZSH Theme - Preview: https://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme this is based

# Define git prompt variables - should come before function definitions
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

# Safe git prompt function
function my_git_prompt_info() {
  # Check if git command exists
  if ! command -v git &>/dev/null; then
    return
  fi
  
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  branch="${ref#refs/heads/}"
  
  # Check if git_prompt_status exists
  if typeset -f git_prompt_status >/dev/null; then
    git_status=$(git_prompt_status)
    [[ -n $git_status ]] && git_status=" $git_status"
  fi
  
  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${git_status}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

function my_conda_info(){
  if [[ -n $CONDA_DEFAULT_ENV ]]; then
    CONDA_ENV="($CONDA_DEFAULT_ENV)"
  # When no conda environment is active, don't show anything
  else
    CONDA_ENV=""
  fi

  echo "${CONDA_ENV}"
}

# Function to build the main prompt
function build_prompt() {
  local git_info="$(my_git_prompt_info)"
  PROMPT="$(my_conda_info) %B%F{blue}%1~%f%b ${git_info}%B»%b "
}

# Timer functions
function pretimer() {
  timer=${timer:-$SECONDS}
}

function showtime() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    if [[ $timer_show -ge 1 ]]; then  # Show duration if >=1 second
      RPROMPT="%F{red}(%{$fg_bold[red]%}${timer_show}s%f)%F{white}[%T]%f"
    else
      RPROMPT="%F{white}[%T]%f"
    fi
    unset timer
  fi
  
  # Rebuild prompt in case git plugin was loaded after theme initialization
  build_prompt
}

# Set hooks
autoload -Uz add-zsh-hook
add-zsh-hook preexec pretimer
add-zsh-hook precmd showtime

# Initialize prompt
build_prompt
