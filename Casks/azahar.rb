cask 'azahar' do
  version '2122.1'
  sha256 'a9adf930747b65b962003fc0057c2dc95ebe0872a51e29e451785e9a9f34101b'

  url "https://github.com/azahar-emu/azahar/releases/download/#{version}/azahar-#{version}-macos-universal.zip"
  desc 'Azahar is an open-source 3DS emulator based on Citra'
  name 'Azahar Emulator'
  homepage 'https://azahar-emu.org/'

  app "azahar-#{version}-macos-universal/Azahar.app"
end
