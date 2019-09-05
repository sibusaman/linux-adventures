export TERM=xterm-256color
export COLORTERM=truecolor

source ~/antigen.zsh
 

 
# Basic zsh config.
umask 077
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${HOME}/.zsh_history"
HISTSIZE='100000'
SAVEHIST="${HISTSIZE}"

export EDITOR="/usr/bin/nano"
export VISUAL="/usr/bin/nano"


#------------------------------------------------------------------------------
# ZSH config
#------------------------------------------------------------------------------
setopt correct                                                  # Auto correct mistakes
setopt extendedGlob                                             # Extended globbing. Allows using regular expressions with *
#setopt nocaseglob                                               # Case insensitive globbing
setopt autocd                                                   # if only directory path is entered, cd there.
autoload -U zmv                                                 # zmv -  a command for renaming files by means of shell patterns.
autoload -U zargs                                               # zargs, as an alternative to find -exec and xargs.

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst



setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt interactivecomments                                      # Ignore lines prefixed with '#'.
setopt hist_ignore_dups                                         # Ignore duplicate in history.
setopt hist_ignore_space                                        # Prevent record in history entry if preceding them with at least one space

# both imports new commands from the history file, and also causes your typed commands to be appended to the history file
#basically to share commands live between the sessions
setopt share_history

#Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY
###############################################################################


#------------------------------------------------------------------------------
# following segment is from manjaro-zsh-config
#------------------------------------------------------------------------------

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
#zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
#zstyle ':completion:*' accept-exact '*(N)'
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh/cache

#WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
###############################################################################


#------------------------------------------------------------------------------
# Color man pages
#------------------------------------------------------------------------------
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r
###############################################################################


#------------------------------------------------------------------------------
# Keybindings section
#------------------------------------------------------------------------------
case $TERM in
    rxvt*|xterm*)
        bindkey "^[[1~" beginning-of-line                               #Home key
        bindkey "^[[4~" end-of-line                                     #End key
        bindkey "^[[7~" beginning-of-line                               #Home key
        bindkey "^[[8~" end-of-line                                     #End key
        bindkey "^[[3~" delete-char                                     #Del key
        bindkey "^[[A" history-beginning-search-backward                #Up Arrow
        bindkey "^[[B" history-beginning-search-forward                 #Down Arrow
        bindkey "^[Oc" forward-word                                     # control + right arrow
        bindkey "^[Od" backward-word                                    # control + left arrow
        bindkey "^H" backward-kill-word                                 # control + backspace
        bindkey "^[[3^" kill-word                                       # control + delete
        bindkey "^[[H" beginning-of-line                                #Home key
        bindkey "^[[F" end-of-line                                      #End key
    ;;

    linux)
        bindkey "^[[1~" beginning-of-line                   #Home key
        bindkey "^[[4~" end-of-line                         #End key
        bindkey "^[[3~" delete-char                         #Del key
        bindkey "^[[A" history-beginning-search-backward    #Up Arrow
        bindkey "^[[B" history-beginning-search-forward     #Down Arrow
    ;;

    screen|screen-*)
        bindkey "^[[1~" beginning-of-line                   #Home key
        bindkey "^[[4~" end-of-line                         #End key
        bindkey "^[[3~" delete-char                         #Del key
        bindkey "^[[A" history-beginning-search-backward    #Up Arrow
        bindkey "^[[B" history-beginning-search-forward     #Down Arrow
        bindkey "^[Oc" forward-word                         # control + right arrow
        bindkey "^[OC" forward-word                         # control + right arrow
        bindkey "^[Od" backward-word                        # control + left arrow
        bindkey "^[OD" backward-word                        # control + left arrow
        bindkey "^H" backward-kill-word                     # control + backspace
        bindkey "^[[3^" kill-word                           # control + delete
    ;;
esac

bindkey "^R" history-incremental-pattern-search-backward 
bindkey "^S" history-incremental-pattern-search-forward
###############################################################################


#------------------------------------------------------------------------------
# Aliases
#------------------------------------------------------------------------------
alias cp="cp -iv"                                               # Confirm before overwriting something
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'

alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB

alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"
alias mkdir="mkdir -v"

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias ll='ls -alF'
###############################################################################


#------------------------------------------------------------------------------
# plgins themes ...
#------------------------------------------------------------------------------
#antigen theme agnoster
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-better-npm-completion
#antigen use oh-my-zsh
antigen bundle git
antigen bundle colorize
antigen apply
alias cat="ccat"            #use colourized version of the car and less
alias less="cless"

#antigen bundle command-not-found
source /usr/share/doc/pkgfile/command-not-found.zsh                                                 #for comamnd not found handling refer to https://wiki.archlinux.org/index.php/Pkgfile#Installation  &&  https://wiki.archlinux.org/index.php/Zsh#The_%22command_not_found%22_handler



#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh                   # Use syntax highlighting
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh         # Use history substring search

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme                                     # powerlevel9k theme
###############################################################################


#------------------------------------------------------------------------------
# User mods 
#------------------------------------------------------------------------------

export SSH_KEY_PATH="~/.ssh/rsa_id"

yhd() {youtube-dl -f 22 "$@" &;}
ysd() {youtube-dl -f 43 "$@" &;}


#jekyll
#export PATH=$PATH:~/.gem/ruby/2.5.0/gems/jekyll-3.7.2/exe

##nvm " node version manager
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
#source /usr/share/nvm/bash_completion                  #for some reason zsh completions work well without this 
source /usr/share/nvm/install-nvm-exec

###############################################################################


#------------------------------------------------------------------------------
# System Specific
#------------------------------------------------------------------------------

# xinput set-prop "Synaptics TM2911-002" "Synaptics Palm Detection" 1		# palm detection 
# xinput set-prop "Synaptics TM2911-002" "Synaptics Palm Dimensions" 5 50		# palm detection, palm size
xinput set-prop "Synaptics TM2911-002" "libinput Tapping Enabled" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" .3		# trackpoint sensitivity

###############################################################################
