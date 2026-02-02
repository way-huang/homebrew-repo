cask "font-iosevka-term-essential" do
  version "34.1.0"
  sha256 "089acb1720bb3f5903734068606b4a1cf13221a1e540789f6957d96104781e5c"

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
