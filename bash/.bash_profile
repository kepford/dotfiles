# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Include local and private environment variables.
if [ -f ~/.alias_local ]; then
    source ~/.bash_local
fi
