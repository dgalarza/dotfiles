fish_add_path $HOME/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

zoxide init fish | source
starship init fish | source
