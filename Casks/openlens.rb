cask "openlens" do
    version "6.0.0"

    if OS.mac? && Hardware::CPU.intel?
      sha256 a06fb9ed2a8dc6b38d1ec3e64d08188c5f4272f202237ecf971cabe56b9ee1e2
      url "https://github.com/MuhammedKalkan/OpenLens/releases/download/v#{version}/OpenLens-#{version}.dmg"
    end

    if OS.mac? && Hardware::CPU.arm?
      sha256 4778d3f68f5edbb7cff8f8b8c0cc453c775dede30a91eab59c9ebef99b2ac4c9
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
