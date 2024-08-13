cask "typora@free" do
  version "0.11.18"
  sha256 "cc8c9b07f4584f81b214d4a2cbc270cb1171d7262f0f7ffdd466f8b74b2da38e"

  url "https://github.com/Pure-Happiness/Typora-0.11.18/releases/download/v0.11.18/Typora-0.11.18.dmg"
  name "Typora"
  desc "Configurable document editor that supports Markdown"
  homepage "https://typora.io/"

  conflicts_with cask: "typora"

  app "Typora.app"

  zap trash: [
    "~/Library/Application Support/abnerworks.Typora",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/abnerworks.typora.sfl*",
    "~/Library/Application Support/Typora",
    "~/Library/Caches/abnerworks.Typora",
    "~/Library/Cookies/abnerworks.Typora.binarycookies",
    "~/Library/Preferences/abnerworks.Typora.plist",
    "~/Library/Saved Application State/abnerworks.Typora.savedState",
    "~/Library/WebKit/abnerworks.Typora",
  ]
end
