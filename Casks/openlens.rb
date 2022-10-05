cask "openlens" do
    version "6.1.2"

    if OS.mac? && Hardware::CPU.intel?
      sha256 "aa791742c55c5e4cbb47b2ebc3fd57f47c7a886847b42623b3006cda772a9d3c"
      url "https://github.com/MuhammedKalkan/OpenLens/releases/download/v#{version}/OpenLens-#{version}.dmg"
    end

    if OS.mac? && Hardware::CPU.arm?
      sha256 "508b7d8d455837dcee44500c5e7c5fe68d7d99aeeae305dcb6da632ffe1fd500"
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
