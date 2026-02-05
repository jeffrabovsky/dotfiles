# (from https://ss64.com/osx/syntax-profile.html)
# ~/.zshrc file is evaluated every time a shell is launched
# ~/.zprofile file is only evaluated when you login to your mac user account

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

HISTSIZE=10000000
SAVEHIST=10000000

alias ll='ls -althrG'
alias now='date -u +"%Y-%m-%dT%H:%M:%SZ"'

export PGUSER=postgres
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# https://github.com/rails/spring#environment-variables
export DISABLE_SPRING=1
# https://virtualenv.pypa.io/en/stable/reference/#envvar-VIRTUAL_ENV_DISABLE_PROMPT
export VIRTUAL_ENV_DISABLE_PROMPT=1
# https://github.com/ghostty-org/ghostty/discussions/3144
export TERM=xterm-256color

# TODO: Remap left option key in iterm to meta, e.g. for 'meta + f' to move forward a word
#       https://stackoverflow.com/a/197092

export PATH="$HOME/.krew/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/go/bin:$PATH"

source <(kubectl completion zsh)
source <(helm completion zsh)

# Generate J Aliases
if [[ -f ~/generate_j_aliases.sh ]]; then
  . ~/generate_j_aliases.sh
fi
