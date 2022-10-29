cask "openlens" do
    version "6.1.14"

    if OS.mac? && Hardware::CPU.intel?
      sha256 "840bbf00210b81b3290bd6999faf01a4cb09b27802d0aa5a30ccbbcd7735c6f6"
      url "https://github.com/MuhammedKalkan/OpenLens/releases/download/v#{version}/OpenLens-#{version}.dmg"
    end

    if OS.mac? && Hardware::CPU.arm?
      sha256 "494b361504e75b1aca4ca30093da5229737f7c5a1edd6b3a023d311ae3e4ddd8"
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
