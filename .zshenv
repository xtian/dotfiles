#!/bin/zsh

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/node/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/xtian/.cargo/bin:$PATH"
export PATH="/Users/xtian/.local/bin:$PATH"
export PATH="/Users/xtian/Projects/src/zig/build/bin:$PATH"
export PATH="/Users/xtian/Projects/src/gyro/zig-cache/bin:$PATH"

export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"

# Make vim the default editor.
export EDITOR='vim';

# Enable history for iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
