if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

zoxide init fish | source
starship init fish | source
