# ratchet - https://github.com/sethvargo/ratchet
class Ratchet < Formula
    desc "A tool for securing CI/CD workflows with version pinning."
    homepage "https://github.com/sethvargo/ratchet"
    version "0.2.1"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 :no_check
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "b6413fd215f4914a6ad5dddaff16124cff0ceea7ab7648f23eaee655c2c38169"
  
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 :no_check
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 :no_check
  
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
