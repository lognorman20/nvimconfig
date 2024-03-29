# Logan's Neovim Config

A personalized variant of [Neovim from Scratch](https://github.com/LunarVim/Neovim-from-scratch)

## Try out this config

First, make sure that you have Neovim installed:

```
brew install neovim
```
(Optional) Clean up any existing nvim plugins
```
rm -rf ~/.local/share/nvim
```

Clone this repo, change the name to `nvim`, and move it to your ~/.config folder with the following command:
```
git clone https://github.com/lognorman20/nvimconfig.git ~/.config/nvim
```

Run `nvim` in the terminal and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

## Get healthy

Open `nvim` from the terminal and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
