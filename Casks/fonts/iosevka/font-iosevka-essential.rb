cask "font-iosevka-essential" do
  version "34.5.0"
  sha256 "bbc253ac3c00d2e4e0715677a739a0529064a2decc6f85c6739446c998cf1500"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/PkgTTF-Iosevka-#{version}.zip"
  name "Iosevka Essential"
  homepage "https://github.com/be5invis/Iosevka/"
  desc "Iosevka Essential only include regular, bold, italic, bold italic, oblique, bold oblique"
  

  livecheck do
    url :url
    strategy :github_latest
  end

  font "Iosevka-Regular.ttf"
  font "Iosevka-Bold.ttf"
  font "Iosevka-Italic.ttf"
  font "Iosevka-BoldItalic.ttf"
  font "Iosevka-Oblique.ttf"
  font "Iosevka-BoldOblique.ttf"
  
  # No zap stanza required
end
