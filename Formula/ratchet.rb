# ratchet - https://github.com/sethvargo/ratchet
class Ratchet < Formula
    desc "A tool for securing CI/CD workflows with version pinning."
    homepage "https://github.com/sethvargo/ratchet"
    version "0.3.1"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "489036637812ad47daf566439789ec76a7302226971421bd9c9b5312e48d9bb3"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "e6361b5ca57bd50b4442e279a4d1a06f21c5bd0cc224ebfdb2ad0c16ce62d925"
  
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "0ae92a365b709769b5158a7ec51cada1e1bd4bbb0e9da660a4542f177a6aae23"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "7c65dbab567fbc6b91f9a622ab61a4ad61b146ef60726c7faaea7806cd0baa3d"
  
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
