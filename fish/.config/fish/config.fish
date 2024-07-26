if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cf switch_tmux_session
alias vim='nvim'
alias vi='nvim'

starship init fish | source
zoxide init fish | source

set -gx EDITOR nvim

set -U fish_greeting ""
set fish_key_bindings fish_vi_key_bindings

# pnpm
set -gx PNPM_HOME "/Users/jan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
