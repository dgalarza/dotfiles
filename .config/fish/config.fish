if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

starship init fish | source
