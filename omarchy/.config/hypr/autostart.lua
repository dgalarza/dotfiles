-- Extra autostart processes.
o.launch_on_start("quickshell --no-duplicate --path ~/.config/quickshell/desktop-clock")

-- When the Dell ultrawide connects, move all numbered workspaces onto it.
o.launch_on_start((os.getenv("HOME") or "") .. "/.local/bin/omarchy-dell-workspace-watch")
