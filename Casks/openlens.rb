cask "openlens" do
    version "6.0.1"

    if OS.mac? && Hardware::CPU.intel?
      sha256 "510feaa9fae95cee4d77f7bc8568e84e79e88bd561eaeebc059153d17afa4055"
      url "https://github.com/MuhammedKalkan/OpenLens/releases/download/v#{version}/OpenLens-#{version}.dmg"
    end

    if OS.mac? && Hardware::CPU.arm?
      sha256 "52e0ce09c151a235898869fab43babebf64816118924065033c078680717e181"
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
