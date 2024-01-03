# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

# Auto-completion
# ---------------
source "~/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "~/.fzf/shell/key-bindings.bash"
