set -gx PATH /opt/homebrew/bin $PATH

# if status is-interactive
    # Commands to run in interactive sessions can go here
# end


starship init fish | source
# /opt/homebrew/bin/brew shellenv | source

# zoxide init fish | source
# direnv hook fish | source
fish_vi_key_bindings

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path /opt/homebrew/opt/avr-gcc@8/bin
fish_add_path /Applications/WezTerm.app/Contents/MacOS
fish_add_path /Applications/neovide.app/Contents/MacOS

set -gx EDITOR nvim
set -gx POETRY_VIRTUALENVS_IN_PROJECT true
# https://www.packetmischief.ca/2016/09/06/ssh-agent-on-os-x/
set -gx SSH_AUTH_SOCK (launchctl getenv SSH_AUTH_SOCK)
set -g fish_greeting

# https://the.exa.website/
alias ls=eza
alias ll="ls -lh"
alias l="ls -la"
alias rt="ls -l --sort newest"
alias u="cd .."
alias n="NVIM_APPNAME=nvim neovide"
alias tldrf='tldr --list | fzf --preview "tldr {1}" --preview-window=right,60% | xargs tldr'

function nvims
    set items cool rocks default kickstart NvChad AstroNvim LazyVim jose
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config » " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end


# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# pyenv init - | source
#  pyenv rehash >/dev/null ^&1

# build python
# For compilers to find zlib and sqlite you may need to set:
export LDFLAGS="$LDFLAGS -L/usr/local/opt/zlib/lib"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/zlib/include"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/sqlite/include"
# For pkg-config to find zlib and sqlite you may need to set:
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH /usr/local/opt/sqlite/lib/pkgconfig"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/anaconda3/bin/conda
    eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

