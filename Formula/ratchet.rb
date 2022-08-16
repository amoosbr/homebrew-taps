# ratchet - https://github.com/sethvargo/ratchet
class Ratchet < Formula
    desc "A tool for securing CI/CD workflows with version pinning."
    homepage "https://github.com/sethvargo/ratchet"
    version "0.3.0"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "78e17b4267d0d353b01a825a7b52a8f228f9ffb938a5e0a828cbbb7bbe637c46"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "00eec381a0dfa41b94310a0df40b52cb281caf61c663b7d62bc5c79654e5f2a3"
  
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "a114fecb06a1ffa5fcf39695e6ffede8dc2bd5617ac33a5095834da7888db4ff"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "6c3a469aae918f177c2dd7a30b0f3fa0262eff9cfbf8ff6146f564047a196f3f"
  
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
