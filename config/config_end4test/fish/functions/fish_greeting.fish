function fish_greeting
    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    echo 'i use nixos btw'
    set_color normal
    #command -v fastfetch &> /dev/null && fastfetch --key-padding-left 5
end
