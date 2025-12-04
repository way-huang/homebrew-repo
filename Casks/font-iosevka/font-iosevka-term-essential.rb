cask "font-iosevka-term-essential" do
  version "33.3.5"
  sha256 "d837a07ae4fd182d9cb16febb806ea0a53012b60bc63ece257e5ec728930ac2c"

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
