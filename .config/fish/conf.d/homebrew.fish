if test -d /opt/homebrew
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
else if test -d /usr/local/Homebrew
    fish_add_path /usr/local/bin /usr/local/sbin
else if test -d /home/linuxbrew/.linuxbrew
    fish_add_path /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin
end
