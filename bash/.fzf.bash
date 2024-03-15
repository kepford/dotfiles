# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.bash"
