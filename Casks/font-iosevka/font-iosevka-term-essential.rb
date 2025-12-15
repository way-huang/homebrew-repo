cask "font-iosevka-term-essential" do
  version "33.3.6"
  sha256 "f23d8e9079ed6c7f834c09f15bd4ce5b330a90c0e26f6dddeb451ee98b57eb48"

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
