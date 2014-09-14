export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.tmux/bin:$PATH"
export PATH="$HOME/.redis/src:$PATH"
export PATH="$HOME/.tmux/plugins/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
