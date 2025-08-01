# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# go bin
if [ -d "/usr/local/go/bin" ] ; then
    export PATH=$PATH:/usr/local/go/bin
fi

if ! command -v nvim --version >/dev/null 2>&1; then
	echo "nvim might be missing or not in path. adding to path"
	if [ -d "/opt/nvim-linux-x86_64/bin" ] ; then
		PATH="$PATH:/opt/nvim-linux-x86_64/bin"
	fi
fi

if ! command -v zig --version >/dev/null 2>&1; then
	echo "zig might be missing or not in path. adding to path"
	if [ -d "/opt/zig" ] ; then
		PATH="$PATH:/opt/zig"
	fi
fi

if ! command -v sf --version >/dev/null 2>&1; then
	echo "sf might be missing or not in path. adding to path"
	if [ -d "/opt/sf/bin" ] ; then
		PATH="$PATH:/opt/sf/bin"
	fi
fi
