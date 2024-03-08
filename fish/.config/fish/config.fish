if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    alias cat="bat"
    alias ls="eza -la -g --icons"
    alias lsd="eza -la -g --icons --tree --level=2"
end
