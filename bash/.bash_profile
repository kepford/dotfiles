# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Include local and private environment variables.
if [ -f ~/.bash_local ]; then
    source ~/.bash_local
fi
. "$HOME/.cargo/env"
. "$HOME/.deno/env"
