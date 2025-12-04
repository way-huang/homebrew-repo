cask "font-iosevka-combined-essential" do
  version "33.3.5"
  sha256 :no_check

  url "https://www.webpagetest.org/blank.html"
  name "Iosevka Essential and Iosevka Term Essential"
  homepage "https://github.com/be5invis/Iosevka/"
  
  depends_on cask: "font-iosevka-essential"
  depends_on cask: "font-iosevka-term-essential"
  depends_on cask: "font-iosevka-aile-essential"
 
  caveats <<~EOS
    Iosevka Essential, Iosevka Term Essential and Iosevka Aile Essential are installed.
    You can use the following command to install them separately:
    brew install --cask font-iosevka-essential font-iosevka-term-essential font-iosevka-aile-essential
  EOS
end
