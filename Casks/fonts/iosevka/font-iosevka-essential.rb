cask "font-iosevka-essential" do
  version "34.6.1"
  sha256 "9b5f505c8ddb686c4f4159e3092ea16cc90697e01a6e04861f89f25fef14082f"

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
