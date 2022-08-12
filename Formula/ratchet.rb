# ratchet - https://github.com/sethvargo/ratchet
class Ratchet < Formula
    desc "A tool for securing CI/CD workflows with version pinning."
    homepage "https://github.com/sethvargo/ratchet"
    version "0.3.0-pre"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "e01f21ea7c1d2e1004517d9a692e5e2dc5ace8330927a0277bef5af8b4024a16"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "1ab12b6523270da89d244a33a6342c6ba7ce29e5db2e92e18482c547fbb1cea0"
  
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "85a1d8f7233953851b3ac132d4f677d09fcf8713da26abde28d2f28e70fae0f9"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "e0760820c2f11e8580825f86d24564a58b9eae33b91458cdacd4dd404419343c"
  
      end
    end

    livecheck do
        url :stable
        strategy :git
        # regex(/(\d+(?:\.\d+)*)/)
      end

    def install
        bin.install "ratchet"
    end
  
  end
