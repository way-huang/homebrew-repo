class DoukDownloader < Formula
  desc "TikTok and DouYin Downloader"
  homepage "https://github.com/JoeanAmier/TikTokDownloader"
  version "5.7"
 
  on_macos do
    on_arm do
      url "https://github.com/JoeanAmier/TikTokDownloader/releases/download/#{version}/DouK-Downloader_V#{version}_macOS_ARM64.zip"
      sha256 "b57ced1f673ed2234e3cdfca4be070b99cc585cfc8bb6a261d24a971818b13c2"
    end

    on_intel do
      url "https://github.com/JoeanAmier/TikTokDownloader/releases/download/#{version}/DouK-Downloader_V#{version}_macOS_X64.zip"
      sha256 "481a6e168589eab10e63a15e1df3761eb71bfd90989fc298aa184015488c718e"
    end
  end

  def install
    lib.install Dir["*"]
    bin.install_symlink lib/"main" => "ttdown"
  end
end
