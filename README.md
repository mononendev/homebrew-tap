# mononendev Homebrew tap

```bash
brew tap mononendev/tap
brew install --cask omniview            # tagged releases of mononendev/omniview
brew install --cask omniview@nightly    # rolling build of the fork's `release` branch
```

The two casks install the same `Omniview.app` and conflict with each other. The nightly build keeps its state in
`~/.omniview-nightly`.

Builds are Apple Silicon only and ad-hoc signed (not notarized); the casks remove the quarantine attribute after
install so Gatekeeper lets the app open.

`version` and `sha256` in `Casks/*.rb` are rewritten by the `Release` and `Nightly Build` workflows in
[mononendev/omniview](https://github.com/mononendev/omniview), which push here with a deploy key. Do not edit them
by hand.
