class Bbdown < Formula
  desc "Bilibili Downloader is acommand-line Bilibili downloader"
  homepage "https://github.com/nilaoda/BBDown"
  version "1.6.3"
  version_date "20240814"
 
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{version_date}_osx-x64.zip"
    sha256 "262c15ca7890898560d00e5ffd5ada1864fbd9d0d58ac4ee492c9f3e73f3ae5f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{version_date}_osx-arm64.zip"
    sha256 "4df84014d818bd6dff2b365b847645340e8955c4450fe965688f41af89a38baa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{version_date}_linux-x64.zip"
    sha256 "ec233b7d8d40b1cc4447dac05be343f53a757dc605743a8808abaa8e97e5d10e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/#{version}/BBDown_#{version}_#{version_date}_linux-arm64.zip"
    sha256 "f58e0a18df1a589375428a0af27ea61f5ce96ffaf67d115f335d5f9bee9a34dc"
  end

  def install
    bin.install "BBDown" => "bbdown"
  end
end
