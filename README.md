# ![chezmoi logo](https://github.com/twpayne/chezmoi/blob/master/assets/images/logo-144px.svg) chezmoi dotfiles

Managing dotfiles securely using [chezmoi](https://chezmoi.io)

chezmoi managed dotfiles for these platforms:

- macOS
- WSL2
- Linux
- Windows

## macOS

### Installation

```bash {"id":"01J71HR6TYNDB008RKTP5T162D"}
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply stefanschulte
```

### Manual steps required

- PRA Access console - Access console needs to be manually downloaded from access.viega.com/login since it's console specific download.
- zscaler download if Viega device

## Windows

### Installation

```powershell {"id":"01J71HR6TYNDB008RKTSYZ441E"}
iex "&{$(irm 'https://get.chezmoi.io/ps1')}"
chezmoi init --apply --verbose https://github.com/stefanschulte/dotfiles.git
```

### Manual steps required

- PRA Access console - Access console needs to be manually downloaded from access.viega.com/login since it's console specific download.
- zscaler download if Viega device
- Maybe: make windows terminal the default terminal
- Import viega pki certs

## License

This project is released under the [MIT License](https://github.com/stefanschulte/dotfiles/blob/main/LICENSE).
