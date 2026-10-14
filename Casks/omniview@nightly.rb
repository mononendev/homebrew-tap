cask "omniview@nightly" do
  version "0.0.0-nightly.20261014.6"
  sha256 "7b8ab4b3b35f393ee1c738ba47787a526e046da337e61262f4d59203d0476005"

  url "https://github.com/mononendev/omniview/releases/download/nightly/Omniview_#{version}_darwin_universal.dmg"
  name "Omniview Nightly"
  desc "Open-source, pluggable IDE for Kubernetes and DevOps (mononendev rolling build)"
  homepage "https://github.com/mononendev/omniview"

  conflicts_with cask: "mononendev/tap/omniview"
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
