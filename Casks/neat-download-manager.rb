cask "neat-download-manager" do
  version :latest
  sha256 :no_check

  url "https://www.neatdownloadmanager.com/file/NeatDMInstaller.dmg"
  name "NeatDownloadManager"
  desc "A free Internet Download Manager"
  homepage "https://www.neatdownloadmanager.com/"

  auto_updates true

  app "NeatDownloadManager.app"
end
