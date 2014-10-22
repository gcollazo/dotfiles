## dotfiles

### Install

```bash
git clone --recursive git@github.com:gcollazo/dotfiles.git
cd dotfiles
./bootstrap.sh
```

The `bootstrap.sh` command will try to symlink all files to your `$HOME` directory.

### Sublime Text Preferences
```
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -s ~/Code/dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/Code/dotfiles/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
```

### Error

```bash
.dotfiles_private: No such file or directory
```

If you get this error just run the following command to create an empty file.

```bash
echo "" > $HOME/.dotfiles_private
```

You can use the created file to safely add commands or aliases that contain credentials or other information you want to keep off the git repository.
