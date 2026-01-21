cask "font-iosevka-term-essential" do
  version "34.0.0"
  sha256 "b23dfbdb7ec4a6f375ab216c285f7de28825a77302a50e122466765c2037867a"

  url "https://github.com/be5invis/Iosevka/releases/download/v#{version}/PkgTTF-IosevkaTerm-#{version}.zip"
  name "Iosevka Term Essential"
  homepage "https://github.com/be5invis/Iosevka/"
  desc "Iosevka Term Essential only include regular, bold, italic, bold italic, oblique, bold oblique"

  livecheck do
    url :url
    strategy :github_latest
  end

  font "IosevkaTerm-Regular.ttf"
  font "IosevkaTerm-Bold.ttf"
  font "IosevkaTerm-Italic.ttf"
  font "IosevkaTerm-BoldItalic.ttf"
  font "IosevkaTerm-Oblique.ttf"
  font "IosevkaTerm-BoldOblique.ttf"

  # No zap stanza required
end
