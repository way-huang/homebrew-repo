cask "font-iosevka-aile-essential" do
  version "34.6.1"
  sha256 "5b0802aadb86ecfb3a31edf7047fd393172c21c00bee62b3a6277517e27887b4"

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
