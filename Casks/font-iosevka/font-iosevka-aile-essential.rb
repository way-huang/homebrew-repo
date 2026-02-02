cask "font-iosevka-aile-essential" do
  version "34.1.0"
  sha256 "d86b3f2590d7c859bb3039ac6ab49ad000401af08ca9f2e73455c1f8552959af"

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
