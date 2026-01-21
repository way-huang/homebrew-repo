cask "font-iosevka-essential" do
  version "34.0.0"
  sha256 "83d3432ab3381737db2ddae982926856565b8ff0d82c0d9c7b31be4c95fb0165"

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
