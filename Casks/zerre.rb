cask "zerre" do
  version "0.8.0"
  sha256 "f7953d2c831ae55728dc278cb935fe3de35a1242e551164012d15b96e7bacbed"

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
