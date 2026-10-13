cask "omniview@nightly" do
  version "0.0.0-nightly.20261013.2"
  sha256 "b650e3fc6da8a13186049b745b01379538770b59de09e02ca891678c7932ab22"

  url "https://github.com/mononendev/omniview/releases/download/nightly/Omniview_#{version}_darwin_universal.dmg"
  name "Omniview Nightly"
  desc "Open-source, pluggable IDE for Kubernetes and DevOps (mononendev rolling build)"
  homepage "https://github.com/mononendev/omniview"

  conflicts_with cask: "omniview"
  depends_on arch: :arm64
  depends_on :macos

  app "Omniview.app"

  # The build is ad-hoc signed, not notarized; without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Omniview.app"]
  end

  zap trash: [
    "~/.omniview-nightly",
    "~/Library/Application Support/dev.omniview.app",
    "~/Library/Caches/dev.omniview.app",
    "~/Library/Preferences/dev.omniview.app.plist",
  ]
end
