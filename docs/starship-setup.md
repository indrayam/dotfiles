# Starship Setup Guide (Mac + Zsh)

Steps to switch from Powerlevel10k to Starship. Starship and Powerlevel10k both set your prompt, so they conflict if both are active — whichever loads last wins. Pick one.

## 1. Install Starship

```bash
brew install starship
```

Or the universal installer:

```bash
curl -sS https://starship.rs/install.sh | sh
```

## 2. Remove Powerlevel10k from ~/.zshrc

In `~/.zshrc`, delete or comment out:

- The instant prompt block near the top:
  ```zsh
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  ```
- The theme source line:
  ```zsh
  source ~/powerlevel10k/powerlevel10k.zsh-theme
  ```
- If using Oh My Zsh: set `ZSH_THEME=""` (empty) instead of `powerlevel10k/powerlevel10k`.

## 3. Add Starship init at the END of ~/.zshrc

```zsh
eval "$(starship init zsh)"
```

This must be the last prompt-related line. If Oh My Zsh is sourced, Starship's init should come after `source $ZSH/oh-my-zsh.sh`.

## 4. Reload

```bash
source ~/.zshrc
```

or just open a new terminal tab.

## 5. (Optional) Powerlevel10k-style look

Starship has no preset that is literally p10k, but the closest powerline-style options are:

```bash
starship preset pastel-powerline -o ~/.config/starship.toml
# or
starship preset tokyo-night -o ~/.config/starship.toml
```

Then tweak `~/.config/starship.toml` — modules, colors, format string. Run `starship config` help or see https://starship.rs/config/ for every module.

Icons need a Nerd Font (e.g. MesloLGS NF, FiraCode Nerd Font) set as your terminal font.

## 6. Verify

```bash
starship --version
starship timings   # shows how long each prompt module takes
```

## Notes

- Your existing config in this repo: `starship/starship.toml` (username, hostname, directory, git, python/rust/java/go, aws/gcloud/azure/k8s, time). Symlink it with `~/.config/starship.toml` -> `$DOTFILES_HOME/starship/starship.toml`.
- p10k is still faster in git repos (background daemon + instant prompt), but its README has said "no new features, most bugs unfixed" since 2024. Starship is actively maintained and works in bash/fish too.
- If the prompt looks broken after switching, check that no other theme line remains in `.zshrc` and that `eval "$(starship init zsh)"` is truly last.
