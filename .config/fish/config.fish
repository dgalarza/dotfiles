fish_add_path $HOME/.local/bin

set -gx fish_function_path ~/.config/fish/functions_local $fish_function_path

alias vim=nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

zoxide init fish | source
starship init fish | source

if functions -q local_config
    local_config
end
