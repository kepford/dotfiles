# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kepford/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kepford/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/kepford/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/kepford/.fzf/shell/key-bindings.bash"
