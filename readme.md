Based on: https://heptapod.host/flowblok/shell-startup

### Quirks
- oh-my-zsh installation replaces `~/.zshrc` file; either run the `./install` script or symlink `~/.zshrc` to `./zsh/interactive` manually
- upon cloning, make sure line endings are LF and not CRLF as CRLF might break the scripts in certain situations (e.g. in WSL Ubuntu); coercing this via global .gitconfig affects all repositories, so it's not an option, but another way is to manually add the following to <this repo>/.git/config once cloned:
```
[core]
    autocrlf = false
```