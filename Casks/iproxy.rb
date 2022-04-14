cask "iproxy" do
  version "nightly"
  sha256 "66b6984b1a3fbebb5f9a9eb1647a4ee375cfb04dd2eb7a40fb6b83dba0cf37d0"

  url "https://nightly.link/xcodebuild/iProxy/workflows/nightly/master/iProxyNightly-macOS.zip"
  name "iProxy"
  desc "Cross platform Web debugging proxy"
  homepage "https://github.com/xcodebuild/iProxy"

  auto_updates true

  app "iProxy.app"
end
