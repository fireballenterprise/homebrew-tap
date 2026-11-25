# Fireball Enterprise Homebrew Tap

Install Fireball Enterprise apps with [Homebrew](https://brew.sh).

**Option 1: add the tap (recommended).** Every Fireball app is then one `brew install` away, and new ones
show up in `brew update` and `brew search fireball`.

```sh
brew tap fireballenterprise/tap
brew install fireball-wrangler                    # Wrangler terminal UI + headless host
brew install --cask fireball-wrangler-app         # Wrangler for macOS (full app)
```

**Option 2: one app directly.**

```sh
brew install fireballenterprise/tap/fireball-wrangler
```

| Folder | Holds |
|---|---|
| `Formula/` | Command-line apps |
| `Casks/` | macOS apps |

The apps are free to use and are **not open source**. See [LICENSE](LICENSE) and the
[Fireball Enterprise Terms](https://fireballenterprise.com/terms). Recipe files here are
updated by each app's release; don't edit them by hand.
