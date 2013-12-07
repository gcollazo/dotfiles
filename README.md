## dotfiles

#### Error

```bash
.dotfiles_private: No such file or directory
```

If you get this error just run the following command to create an empty file.

```bash
echo "" > $HOME/.dotfiles_private
```

You can use the created file to safely add commands or aliases that contain credentials or other information you want to keep off the git repository.