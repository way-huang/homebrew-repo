cask "siyuan-notes@patch" do
  version "3.3.4"
  sha256 :no_check

  on_arm do
    url "https://github.com/demoshang/siyuan-patch/releases/download/v#{version}/siyuan-v#{version}-mac-arm64.dmg"
  end

  on_intel do
    url "https://github.com/demoshang/siyuan-patch/releases/download/v#{version}/siyuan-v#{version}-mac.dmg"
  end

  name "SiYuan"
  desc "an open source notes"
  homepage "https://github.com/demoshang/siyuan-patch"

  app "SiYuan.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/SiYuan.app"]
  end
end
