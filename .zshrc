source ~/.config/zsh/zsh-git-prompt/zshrc.sh

#
# Modules
#

autoload -Uz compinit; compinit
_comp_options+=(globdots)

zstyle ':completion:*' matcher-list "m:{a-zA-Z}={A-Za-z}" # ignore case
zstyle ':completion:*' menu select=2 _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns "_*"

#
# Options
#

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
setopt PROMPT_SUBST           # Variable substitution in prompt
setopt PUSHD_IGNORE_DUPS      # Do not store duplicates in the stack
setopt SHARE_HISTORY          # Share history between all sessions

#
# Aliases
#

alias ls="exa"
alias la="exa -a"
alias lla="exa -al"
alias ps="procs"

alias be="bundle exec"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias g='git'

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

VIMODE="I"

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

PROMPT='%5~$(git_super_status)%# '

readonly RPROMPT_TEMPLATE='%F{white}%(?..%?) ${VIMODE}%f'
RPROMPT=$RPROMPT_TEMPLATE

#
# Keybindings
#

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # Like default, but without /

# https://misha.brukman.net/blog/2019/12/uniting-vim-and-emacs-in-zsh/

bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search
bindkey "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
bindkey "^Y" yank

function zle-line-init() {
  # Note: this initial mode must match the $VIMODE initial value above.
  zle -K viins
}

zle -N zle-line-init

# Show insert/command mode in vi.
# zle-keymap-select is executed every time KEYMAP changes.
function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/C}/(main|viins)/I}"
  RPROMPT=$RPROMPT_TEMPLATE
  zle reset-prompt
}

zle -N zle-keymap-select

# 'v' in visual mode opens VIM to edit the command in a full editor.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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
