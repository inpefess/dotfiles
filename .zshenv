# basic locations
export LOCALDIR=$HOME/.local
export PATH=$LOCALDIR/bin:$PATH
export OPTDIR=$HOME/opt
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$LOCALDIR/share
export XDG_CACHE_HOME=$HOME/.cache
# locations for dotfiles
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
# shell history
export HISTFILE=$XDG_CONFIG_HOME/zsh/.zsh_history
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE
# locale
export LANG=en_GB.UTF-8
export LANGUAGE=$LANG
export LC_ALL=$LANG
# configurations for compilation
export LD_LIBRARY_PATH=$LOCALDIR/lib64:$LOCALDIR/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$LOCALDIR/lib64:$LOCALDIR/lib:$LD_RUN_PATH
export LDFLAGS="-L$LOCALDIR/lib -L$LOCALDIR/lib64"
export CFLAGS="-I$LOCALDIR/include -I/usr/include/mkl"
export CPPFLAGS=$CFLAGS
export PKG_CONFIG_PATH=$LOCALDIR/lib64/pkgconfig:$LOCALDIR/lib/pkgconfig$PKG_CONFIG_PATH
# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
# Isabelle proof assistant
export ISABELLE_HOME_USER=$XDG_CONFIG_HOME/isabelle
export ISABELLE_HOME=$OPTDIR/Isabelle
export PATH=$ISABELLE_HOME/bin:$PATH
# GNU Parallel
export PARALLEL_HOME=$XDG_CONFIG_HOME/parallel
# TeX
export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2021/texmf/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2021/texmf/doc/info:$INFOPATH
# Coq
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
# Gradle
export PATH=$PATH:/opt/gradle/gradle-8.1.1/bin
# VPN
export PATH=/opt/cisco/anyconnect/bin:$PATH
# Go
export PATH=$HOME/go/bin:$PATH
# for poetry
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
