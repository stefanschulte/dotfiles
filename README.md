# ![chezmoi logo](https://github.com/twpayne/chezmoi/blob/master/assets/images/logo-144px.svg) chezmoi dotfiles

Managing dotfiles securely using [chezmoi](https://chezmoi.io)

chezmoi managed dotfiles for these platforms:

- macOS
- WSL2
- Linux
- Windows

## macOS and Linux

### Installation

```bash {"id":"01J71HR6TYNDB008RKTP5T162D"}
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply robbikaiser
```

### Manual steps required

- Enable the 1password ssh agent
- PRA Access console - Access console needs to be manually downloaded from access.viega.com/login since it's console specific download.
- zscaler download if Viega device

## Windows

### Installation

Start with opening a powershell terminal and run the below commands:
(the first command executes the script to install the chezmoi binary, the second command download and applies your dotfiles)

```powershell {"id":"01J71HR6TYNDB008RKTSYZ441E"}
iex "&{$(irm 'https://get.chezmoi.io/ps1')}"
chezmoi init --apply --verbose https://github.com/robbikaiser/dotfiles.git
```

After finishing the Windows application installations, we need to setup the 1password ssh agent integration:
While documentation for this step is currently out-of-scope of this readme, the only thing you should be required to do is enabling the ssh agent integration in the 1password settings, without having to change any of your files (dotfiles will do that for you anyways).

After having activated 1password ssh agent, now start the newly installed "Ubuntu" app, this will open a terminal and guide you through the initial setup of a barebone Ubuntu WSL environment.
After having created your user and password, run the command (from inside the Ubuntu WSL shell) listed under "macOS and Linux" in this readme to bootstrap the Ubuntu WSL environment.

### Post installation manual steps required

- PRA Access console - Access console needs to be manually downloaded from access.viega.com/login since it's console specific download.
- zscaler download if private device is used for work
- Maybe: make windows terminal the default terminal

## License

This project is released under the [MIT License](https://github.com/robbikaiser/dotfiles/blob/main/LICENSE).
