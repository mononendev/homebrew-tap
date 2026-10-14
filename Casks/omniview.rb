cask "omniview" do
  version "0.4.0"
  sha256 "645cc3ebfe09f02c00beac675555913bbdb1996e8b8ca2f942d73b21496e7f72"

  url "https://github.com/mononendev/omniview/releases/download/v#{version}/Omniview_#{version}_darwin_universal.dmg"
  name "Omniview"
  desc "Open-source, pluggable IDE for Kubernetes and DevOps (mononendev build)"
  homepage "https://github.com/mononendev/omniview"

  conflicts_with cask: "mononendev/tap/omniview@nightly"
  depends_on arch: :arm64
  depends_on :macos

  app "Omniview.app"

  # The build is ad-hoc signed, not notarized; without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Omniview.app"]
  end

  zap trash: [
    "~/.omniview",
    "~/Library/Application Support/dev.omniview.app",
    "~/Library/Caches/dev.omniview.app",
    "~/Library/Preferences/dev.omniview.app.plist",
  ]
end
