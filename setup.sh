mv ~/.config/i3/config ~/.config/i3/config.backup
stow i3
stow picom
stow polybar
stow rofi
stow alacritty
stow nvim
stow bash
source ~/.bashrc
stow tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux new-session -d -s test
tmux source ~/.config/tmux/tmux.conf
tmux kill-server
