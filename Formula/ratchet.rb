# ratchet - https://github.com/sethvargo/ratchet
class Ratchet < Formula
    desc "A tool for securing CI/CD workflows with version pinning."
    homepage "https://github.com/sethvargo/ratchet"
    version "0.2.3"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "53ed686e81f0c249d2fb72c009b116347727afd98e1ce84e8e5cee04b0514ee0"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "8c22a688e418b4d1b231de632ed0997b17adac61d36c3aefcb7173830256bb7d"
  
      end
    end
  
    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_arm64.tar.gz", :using => CurlDownloadStrategy
        sha256 "4e4498c75c9f421f32e9ea7ecb84fc3b7d103a29fb6cf30c05c7d56b2546a7c4"
  
      end
      if Hardware::CPU.intel?
        url "https://github.com/sethvargo/ratchet/releases/download/v#{version}/ratchet_#{version}_linux_amd64.tar.gz", :using => CurlDownloadStrategy
        sha256 "1cc41e2a8dd53c8261cc9496428a439079435a8d0df40d64b2a906a1722e469d"
  
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
