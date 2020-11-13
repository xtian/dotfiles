source ~/.config/zsh/zsh-git-prompt/zshrc.sh

#
# Options
#

# setopt AUTO_MENU # Show completion menu on successive tab press. needs unsetop menu_complete to work
# setopt AUTO_NAME_DIRS # Any parameter that is set to the absolute name of a directory immediately becomes a name for that directory

setopt ALWAYS_TO_END          # When completing from the middle of a word, move the cursor to the end of the word
setopt AUTO_CD                # Go to folder path without using cd
setopt AUTO_PUSHD             # Push the old directory onto the stack on cd
setopt CDABLE_VARS            # Change directory to a path stored in a variable
setopt COMPLETE_IN_WORD       # Allow completion from within a word/phrase
setopt CORRECT                # Spelling correction for commands
setopt CORRECTALL             # Spelling correction for arguments
setopt EXTENDED_GLOB          # Use extended globbing syntax
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space
setopt HIST_REDUCE_BLANKS     # Remove extra blanks from each command line being added to history
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file
setopt HIST_VERIFY            # Do not execute immediately upon history expansion
setopt PUSHD_IGNORE_DUPS      # Do not store duplicates in the stack
setopt SHARE_HISTORY          # Share history between all sessions

#
# Aliases
#

alias ls="exa"
alias la="exa -a"
alias lla="exa -al"
alias ps="procs"
alias sed="sd"

alias be="bundle exec"

# Get public-facing IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Get IP address on local network
alias localip="ipconfig getifaddr en0"

alias up="brew update && brew upgrade; mas upgrade; rustup self update; rustup update"

# Make a quick working commit
alias workin="git add . && git commit -am workin"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

#
# Functions
#

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function compress() {
  local tmpFile="${@%/}.tar";
  tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

  size=$(
    stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
    stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
  );

  local cmd="";
  if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
    # the .tar file is smaller than 50 MB and Zopfli is available; use it
    cmd="zopfli";
  else
    if hash pigz 2> /dev/null; then
      cmd="pigz";
    else
      cmd="gzip";
    fi;
  fi;

  echo "Compressing .tar using \`${cmd}\`…";
  "${cmd}" -v "${tmpFile}" || return 1;
  [ -f "${tmpFile}" ] && rm "${tmpFile}";
  echo "${tmpFile}.gz created successfully.";
}

# Add easy extract support
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar Jxvf $1   ;;
      *.lzma)    unlzma $1     ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *.xz)      unxz $1       ;;
      *.exe)     cabextract $1 ;;
      *)         echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Create a new directory and enter it
function mkd() { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Reload the shell (i.e. invoke as a login shell)
function reload() { exec $SHELL -l }

#
# Prompt
#

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

PROMPT='%~$(git_super_status) %# '
RPROMPT='%(?..%F{white}%?%f)'

#
# Miscellaneous
#

dm_val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [[ $dm_val == "Dark" ]]; then
    if [[ $ITERM_PROFILE == "Default" ]]; then
        echo -ne "\033]50;SetProfile=Dark\a"
        export ITERM_PROFILE="Dark"
    else
        echo -ne "\033]50;SetProfile=Default\a"
        export ITERM_PROFILE="Default"
    fi
fi

eval "$(hub alias -s)"

ssh-add -A 2> /dev/null

[[ -e ~/.zshrc.local ]] && source ~/.zshrc.local
