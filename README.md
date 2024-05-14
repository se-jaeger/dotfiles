# dotfiles

My personal dot files managed by chezmoi.

## Setup new machine

On Ubuntu:

```bash
sudo sh -c "$(curl -fsLS chezmoi.io/get)" -- -b "/usr/local/bin"
chezmoi init --apply se-jaeger
```

On macOS

```bash
brew install chezmoi
chezmoi init --apply se-jaeger
```

## VSCodium Extension Registry

By default, VSCodium uses the [Open VSX Extension Registry](https://open-vsx.org/). However, one probably wants to install extensions from the VSCode store. Therefore, these dotfiles create the file `~/Library/Application Support/VSCodium/product.json` and configure it as default store. For some extensions (e.g., `Open Remote - SSH`), you need to switch back to these settings (or delete the `product.json` file):

```json
{
  "extensionsGallery": {
    "serviceUrl": "https://open-vsx.org/vscode/gallery",
    "itemUrl": "https://open-vsx.org/vscode/item"
  }
}
```
