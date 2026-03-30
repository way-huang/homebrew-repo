cask "font-iosevka-essential" do
  version "34.3.0"
  sha256 "5cd0bef94054a2972b789846b07ebb0d8ec10b0604f88116988697323179ecf9"

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
