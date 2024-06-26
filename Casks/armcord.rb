cask "armcord" do

  arch arm: "-arm64", intel: ""


  version "3.2.7"
  sha256 arm: "805a27b3b4d410ebbcdccdcf6ce3856ca11528171860dfbe027d7bd9ce15541f",
  intel: "66e7c858ad3b20e9906c122d5a918a1b51e0ee7ab907ccf88b1ae25755e79495"

  url "https://github.com/ArmCord/ArmCord/releases/download/v#{version}/ArmCord-#{version}#{arch}.dmg",
      verified: "github.com/ArmCord/ArmCord/"
  name "armcord"
  desc "Custom lightweight Discord client designed to enhance your experience"
  homepage "https://armcord.app/"

  app "armcord.app"

  postflight do
    `codesign --force --deep --sign - "#{appdir}/armcord.app"`
    `xattr -r -d com.apple.quarantine "#{appdir}/armcord.app"`
  end

  zap trash: [
    "~/Desktop/armcord",
    "~/Library/Application Support/ArmCord",
    "~/Library/Preferences/com.smartfridge.armcord.plist",
    "~/Library/Saved Application State/com.smartfridge.armcord.savedState",
  ]
end
