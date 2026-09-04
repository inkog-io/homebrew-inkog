# Homebrew Formula for Inkog CLI
# To use: brew tap inkog-io/inkog && brew install inkog

class Inkog < Formula
  desc "Pre-flight check for AI agents"
  homepage "https://inkog.io"
  license "Apache-2.0"
  version "1.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-arm64"
      sha256 "f63b88813d93c8c0f4ba67af661fbc4f8b7389de9731d22886365424a9fe42f0"

      def install
        bin.install "inkog-darwin-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-amd64"
      sha256 "ba1ba8768613dfbb1108e0cb880737eae923b88f6c9864410b09ee7ddef4f6e8"

      def install
        bin.install "inkog-darwin-amd64" => "inkog"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-arm64"
      sha256 "d9e587d3f350a0300537642432089cd3cdf07ec210b8c4fc0d87c78c37121e67"

      def install
        bin.install "inkog-linux-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-amd64"
      sha256 "8559893acf51a9664f5fc010bfccd90326e99d9f4506bc8a06c00f4967c37bbc"

      def install
        bin.install "inkog-linux-amd64" => "inkog"
      end
    end
  end

  test do
    assert_match "Inkog", shell_output("#{bin}/inkog --help")
  end
end
