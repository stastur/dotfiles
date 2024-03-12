### Git configs
```bash
echo "[user]\nemail = ..." >> ~/personal.gitconfig
echo "[user]\nemail = ..." >> ~/workspace.gitconfig
```

### Stow commands

```bash
stow --target=$HOME --restow */
```

```bash
stow --target=$HOME --delete */
```
