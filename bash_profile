export PATH="/usr/local/bin:~/.dotfiles/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# Auto start of rbenv on load
eval "$(rbenv init -)"

# Default editor vs code
export EDITOR='code -n -w'

alias be="bundle exec"

# Adds git branch with colour to PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] λ "

# Opens a new terminal tab
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

# Allow the execution of the git autocomplete script if it present
test -f ~/.git-completion.bash && . $_
