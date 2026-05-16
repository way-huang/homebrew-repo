cask 'azahar' do
  version '2125.1.2'
  sha256 'e6e0e51ce100165ea9b82fe171887a7a7819fc282b1ccb8c9e976f62b5c8e30b'

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-macos-universal-#{version}.zip"
  desc 'Azahar is an open-source 3DS emulator based on Citra'
  name 'Azahar Emulator'
  homepage 'https://azahar-emu.org/'

  app "azahar-#{version}-macos-universal/Azahar.app"
end
