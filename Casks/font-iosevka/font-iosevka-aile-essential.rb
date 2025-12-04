cask "font-iosevka-aile-essential" do
  version "33.3.5"
  sha256 "cd5372b6409f9a78a7097c8e3a86799572474fbe8f7a9ef5378681c98b561afc"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/PkgTTF-IosevkaAile-#{version}.zip"
  name "Iosevka Aile Essential"
  homepage "https://github.com/be5invis/Iosevka/"
  desc "Iosevka Aile Essential only include regular, bold, italic, bold italic, oblique, bold oblique"
  

  livecheck do
    url :url
    strategy :github_latest
  end

  font "IosevkaAile-Regular.ttf"
  font "IosevkaAile-Bold.ttf"
  font "IosevkaAile-Italic.ttf"
  font "IosevkaAile-BoldItalic.ttf"
  font "IosevkaAile-Oblique.ttf"
  font "IosevkaAile-BoldOblique.ttf"
  
  # No zap stanza required
end
