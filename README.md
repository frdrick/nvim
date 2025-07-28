# My neovim configuration (originally a fork of kickstart.nvim)

### Install Neovim

This nvim config targets _only_ the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

> **NOTE** > [Backup](#FAQ) your previous configuration (if any exists)

External Requirements:

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Windows Installation](#Windows-Installation) to double check any additional Windows notes

Neovim's configurations are located under the following paths, depending on your OS:

| OS                   | PATH                                      |
| :------------------- | :---------------------------------------- |
| Linux, MacOS         | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)        | `%userprofile%\AppData\Local\nvim\`       |
| Windows (powershell) | `$env:USERPROFILE\AppData\Local\nvim\`    |

### Install this nvim config

Clone repository

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/frdrick/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/frdrick/nvim.git %userprofile%\AppData\Local\nvim\
```

If you're using `powershell.exe`

```
git clone https://github.com/frdrick/nvim.git $env:USERPROFILE\AppData\Local\nvim\
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim.

### FAQ

- What should I do if I already have a pre-existing neovim configuration?
  - You should back it up and then delete all associated files.
  - This includes your existing init.lua and the neovim files in `~/.local` which can be deleted with `rm -rf ~/.local/share/nvim/`
- What if I want to "uninstall" this configuration:
  - See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information

### Windows Installation
