cask "font-iosevka-essential" do
  version "33.3.6"
  sha256 "657890173165f11a35c27c794ade1dcd307e5523bca67455bc0c4ef3a0d3466c"

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
