#!/bin/bash -e
[ -v DOT_DEBUG ] && set -x

. "$(dirname "$0")/_config.sh"

echo 'Configuring tmux...'
confirm_binaries "git" "tmux"

cp -f "${DOT_ROOT}/files/tmux/tmux.conf" $HOME/.tmux.conf

# update remote dependencies
if [ -v DOT_REINSTALL ] || [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    rm -rf $HOME/.tmux/plugins/tpm
    git clone --depth 1 https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

echo "-> tmux setup finished, use 'prefix+I' (capital 'i') to install tmux plugins."
