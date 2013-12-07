## dotfiles

### Install

```bash
git clone git@github.com:gcollazo/dotfiles.git
cd dotfiles
./bootstrap.sh
```

The `bootstrap.sh` command will try to symlink all files to your `$HOME` directory.

### Error

```bash
.dotfiles_private: No such file or directory
```

If you get this error just run the following command to create an empty file.

```bash
echo "" > $HOME/.dotfiles_private
```

You can use the created file to safely add commands or aliases that contain credentials or other information you want to keep off the git repository.
