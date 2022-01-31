alias try="xdg-open"

# Navigation aliases
alias quit="exit"
alias ..="cd .."

alias nwlist="nmcli dev wifi list"
alias nwconnect="nmcli dev wifi connect"

# text zoom for convenience
alias chzoom="gsettings set org.gnome.desktop.interface text-scaling-factor"

# try to use stack for ghc
alias ghc="stack ghc"
alias ghci="stack ghci"
alias ghc-pkg="stack exec ghc-pkg --"

# easy launch for some applications
alias ff="firefox &>/dev/null &"
alias naut="nautilus . &>/dev/null &"

# easy gdrive mount and sync (WARNING: HOLDS THE TERMINAL) TODO: maybe mount all of gdrive in the future..
alias gmount="sudo umount ~/gdrive && google-drive-ocamlfuse ~/gdrive && source ~/math/venv/bin/activate && python3 ~/math/Masters/sync.py ~/math/Masters ~/gdrive/Math/Masters --pull"

alias less="less -r"
alias ls="ls -a --color=always"
alias ll="ls -lh"
# tree
alias lt="tree -L 2"

alias f="fd -HI -c always"
alias rg="rg --color=always"
alias rga="rg --color=auto"
#cmake in build
alias dcmake="cd build && cmake .. && cd .."
