# What is this?

My Alacritty+Neovim+Tmux Build that substantially increases coding/typing productivity<br />
aka. my "workspace" setup

# Screenshot

Picture of 3 alacritty nvim instances, one running terminal using tmux
![Alt text](./showcase.png)

# Usage

Tmux config from Fatih Arslan

```
    create a tab: ctrl-f c
    close a tab: ctrl-f &
    close a pane: ctrl-f x (this also closes the tab if there is a single pane)
    create vertical pane: ctrl-f v
    create horizontal pane: ctrl-f s
    move between panes: ctrl-f h, ctrl-f j, ctrl-f k and ctrl-f l
    resize panes: ctrl-f H, ctrl-f J, ctrl-f K and ctrl-f L
    jump to specific tab: ctrl-f <number>, i.e: ctrl-f 3
```

Neovim config

```
	NERDTree:
		Show Hidden Files - Shift + i
		Toggle Tree - Ctrl + b
		Switch to Next Opened File - Ctrl + RightArrow
		Switch to Previous Opened File - Ctrl + LeftArrow
	Floaterm:
		Toggle Terminal - Alt + Escape
		Exit Terminal Edit Mode - Escape + Escape

```

# Plugins

- Gruvbox Theme - https://github.com/morhetz/gruvbox
- Coc.nvim - https://github.com/neoclide/coc.nvim
- Nerdtree - https://github.com/preservim/nerdtree
- Nerdtree Git Plugin - https://github.com/Xuyuanp/nerdtree-git-plugin
- Nerdtree Syntax Highlight - https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
- Vim-Floaterm - https://github.com/voldikss/vim-floaterm

# Repositories

- Github - https://github.com/ronylee11/ant
- Gitlab - https://gitlab.com/ronylee11/ant

# Useful Resources

- Vim Tutorial - https://www.youtube.com/watch?v=H3o4l4GVLW0&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R
- How to add Vim Plugins - https://www.linuxfordevices.com/tutorials/linux/vim-plug-install-plugins
- Lazygit - https://github.com/jesseduffield/lazygit
- Ben Awad's Vim configure tutorial - https://www.youtube.com/watch?v=gnupOrSEikQ
- benbrastmckie's ANT build - https://www.youtube.com/watch?v=Xvu1IKEpO0M&t=226s
- Fatih Arslan's article about Integrating Alacritty with Tmux - https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/
- ANT True Color issue - https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
- NERDTree Keybind - https://vi.stackexchange.com/questions/9967/how-do-i-open-and-close-nerdtree-toggle-nerdtree-view-using-a-single-keystroke
- Floaterm Keybind - https://github.com/vim/vim/issues/2216
