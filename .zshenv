#!/usr/bin/env zsh
source ~/.my_zshenv


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($CONDA'/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    echo "Running conda_setup"
    eval "$__conda_setup"
else
    if [ -f "$CONDA_ROOT/etc/profile.d/conda.sh" ]; then
        . "$CONDA_ROOT/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

