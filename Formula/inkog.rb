# Homebrew Formula for Inkog CLI
# To use: brew tap inkog-io/inkog && brew install inkog

class Inkog < Formula
  desc "Pre-flight check for AI agents"
  homepage "https://inkog.io"
  license "Apache-2.0"
  version "1.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-arm64"
      sha256 "d18b8298774b88f2c26543da9ad454f98ab7c72d826d3cc01cf149bb965d1b0c"

      def install
        bin.install "inkog-darwin-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-amd64"
      sha256 "0e9ff648f27a1cf67440fe960aabc33b6e010d332d385391a7b7ecf773cbbbec"

      def install
        bin.install "inkog-darwin-amd64" => "inkog"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-arm64"
      sha256 "d26b3967607eb57d66bf046a4f5944535adb768caa6c50bd85c57f17e55532c8"

      def install
        bin.install "inkog-linux-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-amd64"
      sha256 "643fcaccb352fc288cde4f95e6cacf813fbf20a772077eeb362b2b1adbe76f3d"

      def install
        bin.install "inkog-linux-amd64" => "inkog"
      end
    end
  end

  test do
    assert_match "Inkog", shell_output("#{bin}/inkog --help")
  end
end
