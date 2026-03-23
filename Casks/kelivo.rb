cask "kelivo" do
  version "1.1.8,26"
  sha256 :no_check

  url "https://github.com/Chevey339/kelivo/releases/download/v#{version.csv.first}/Kelivo_macos_#{version.csv.first}+#{version.csv.second}.dmg"
  name "Kelivo"
  desc "A Flutter LLM Chat Client. Support Mobile & Desktop"
  homepage "https://kelivo.psycheas.top/"

  app "kelivo.app"
end
