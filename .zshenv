# basic locations
export LOCALDIR=$HOME/.local
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$LOCALDIR/share
export XDG_CACHE_HOME=$HOME/.cache
# locations for dotfiles
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
export HISTSIZE=10000
export HISTFILESIZE=10000
# locale
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8
# configurations for compilation
export LD_LIBRARY_PATH=$LOCALDIR/lib64:$LOCALDIR/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$LOCALDIR/lib64:$LOCALDIR/lib:$LD_RUN_PATH
export LDFLAGS="-L$LOCALDIR/lib"
export CFLAGS="-I$LOCALDIR/include"
export CPPFLAGS="-I$LOCALDIR/include"
export PKG_CONFIG_PATH=$LOCALDIR/lib64/pkgconfig:$LOCALDIR/lib/pkgconfig$PKG_CONFIG_PATH
# PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$LOCALDIR/bin:$PATH
