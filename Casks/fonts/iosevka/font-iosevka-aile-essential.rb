cask "font-iosevka-aile-essential" do
  version "34.4.0"
  sha256 "23f27046c75a456a121a132296be498bf199dd75a779d4af35143de5ba0fad74"

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
