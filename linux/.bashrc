# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# starship
eval "$(starship init bash)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/home/bai/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
. "$HOME/.cargo/env"

# alias
alias gs="git status -s"
alias gl='git log --oneline --graph --all --decorate'
alias gcm='git commit -m'
alias gsw='git switch'

alias edit="msedit"

alias code="zed"

# text editor
function open_text_editor() {
    # "$1 for file path" ,">/dev/null 2>&1" for silence output, "disown" for detach the background
    # wrap with () to silence status console from showing the bashrc function is succesfully performed
    (flatpak run org.gnome.TextEditor "$1" >/dev/null 2>&1 & disown)
}
alias note=open_text_editor

# nautilus
function open_nautilus(){
    (nautilus "$1" >/dev/null 2>&1 & disown)
}
alias file=open_nautilus

# whisper
alias whisper="/home/bai/LLM/Whisper/whisper-cli -m /home/bai/LLM/Whisper/models/ggml-medium-q5_0.bin"

# aria2c
alias grab="aria2c -x 16 -s 16 -k 1M -d Downloads"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
