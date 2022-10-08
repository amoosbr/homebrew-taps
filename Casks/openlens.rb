cask "openlens" do
    version "6.1.10"

    if OS.mac? && Hardware::CPU.intel?
      sha256 "8444755dc17cd99a192100a6e6687624b301b284cbe45274cbde929ab68ce91d"
      url "https://github.com/MuhammedKalkan/OpenLens/releases/download/v#{version}/OpenLens-#{version}.dmg"
    end

    if OS.mac? && Hardware::CPU.arm?
      sha256 "a499d719cabbb237322d37d11a8f24d26de623f6b08496a0726509c3836f3c10"
      url "https://github.com/MuhammedKalkan/OpenLens/releases/download/v#{version}/OpenLens-#{version}-arm64.dmg"
    end

    name "Open Lens"
    desc "Kubernetes IDE, Open Source"
    homepage "https://github.com/MuhammedKalkan/OpenLens"

    livecheck do
      url "https://raw.githubusercontent.com/MuhammedKalkan/OpenLens/main/version"
      strategy :page_match
      regex(/(\d+(?:\.\d+)*)/)
    end

    auto_updates true

    app "OpenLens.app"

    zap trash: [
      "~/Library/Application Support/OpenLens",
      "~/Library/Caches/OpenLens",
      "~/Library/Logs/OpenLens",
      "~/Library/Preferences/com.electron.open-lens.plist",
      "~/Library/Saved Application State/com.electron.open-lens.savedState",
    ]
  end
