cask 'azahar' do
  version '2125.1.2'
  sha256 'sha256:5d3aedc3840cf3b536caea9e9b60811e6c3a07475e2e5a36d816ffcbd58eecb4'

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-macos-universal-#{version}.zip"
  desc 'Azahar is an open-source 3DS emulator based on Citra'
  name 'Azahar Emulator'
  homepage 'https://azahar-emu.org/'

  app "azahar-#{version}-macos-universal/Azahar.app"
end
