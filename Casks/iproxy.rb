cask "iproxy" do
  version "nightly"
  sha256 :no_check

  url "https://nightly.link/xcodebuild/iProxy/workflows/nightly/master/iProxyNightly-macOS.zip"
  name "iProxy"
  desc "Cross platform Web debugging proxy"
  homepage "https://github.com/xcodebuild/iProxy"

  auto_updates true

  app "iProxy.app"
end
