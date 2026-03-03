cask "font-iosevka-term-essential" do
  version "34.2.1"
  sha256 "e0d1392f9e3d2c39567551212348e50881ee67bb2bd91356dd9be546084627f9"

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
