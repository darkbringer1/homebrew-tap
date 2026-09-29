cask "zerre" do
  version "0.6.0"
  sha256 "7baec08aa54a41fa41973ebb7959e891c82502b28bf0e7f2fb5aca7c5ae1af49"

  url "https://github.com/darkbringer1/zerre/releases/download/v#{version}/Zerre-#{version}.dmg"
  name "Zerre"
  desc "Tiny pixel creature that lives on your desktop and grows from your workday"
  homepage "https://zerre.dogukaan.dev/"

  livecheck do
    url "https://zerre.dogukaan.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Zerre.app"
  binary "#{appdir}/Zerre.app/Contents/MacOS/zerrectl"

  uninstall quit: "com.dogukaan.zerre"

  zap trash: [
    "~/Library/Application Support/Zerre",
    "~/Library/Caches/com.dogukaan.zerre",
    "~/Library/HTTPStorages/com.dogukaan.zerre",
    "~/Library/Preferences/com.dogukaan.zerre.plist",
  ]

  caveats <<~EOS
    Zerre can add small hooks to your coding agents, git and zsh when you connect them.
    To take those out too, use Settings › Your data › Remove Zerre from this Mac
    before uninstalling.
  EOS
end
