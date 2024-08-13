class Bbdown < Formula
  desc "Bilibili Downloader is acommand-line Bilibili downloader"
  homepage "https://github.com/nilaoda/BBDown"
  version "1.6.2"
 
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_osx-x64.zip"
    sha256 "b0e8275eaae5d8a13bf66f5ba8f294b7e61d658be86bac6201a764162b20b0d7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_osx-arm64.zip"
    sha256 "65e81ecdf574c2ee8d2d7c36afcc17a67c53e0172acc6f8f642d89da698ed44d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_linux-x64.zip"
    sha256 "1a5e3889655e5ae6d1b4bac7c9c67d9a3ba7a95eb6d0a3f3553030ee5483bba9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/nilaoda/BBDown/releases/download/1.6.2/BBDown_1.6.2_20240512_linux-arm64.zip"
    sha256 "3d3a1e105b8518e573f8817c1cecb6c4d18d2678c78f979e7224ea92892ef065"
  end

  def install
    bin.install "BBDown" => "bbdown"
  end
end
