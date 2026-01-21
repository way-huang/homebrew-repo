cask "font-iosevka-aile-essential" do
  version "34.0.0"
  sha256 "64993b69900f873dfe5b7ac48bb478bd0dcc04687c852ce94e608f94a9a8de5d"

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
