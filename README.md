# dotfiles

### Install OS updates
Make sure your machine has all OS updates installed.

```bash
sudo softwareupdate --install --all
```

### Clone, install and symlink
Clone this repo and run the install script. This script will also run `symlinks.sh`.

```bash
git clone git@github.com:gcollazo/dotfiles.git
cd dotfiles
./install.sh
```

### Atom Packages
Launch Atom and **Install Shell Commands**. Once the Atom shell commands are installed you can install packages. All the packages that I use are starred and can be found on my [user profile](https://atom.io/users/gcollazo/stars).

To install packages:

```bash
apm login
apm stars --install
```

To update starred packages:

```bash
apm-stars-update
```

## Manual Installs

### Install From AppStore
```bash
mas signin user@example.com
./install-mas.sh
```

### Download Installers
- [Chrome](https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [Tor](https://www.torproject.org/download/download-easy.html.en)
