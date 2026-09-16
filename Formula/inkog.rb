# Homebrew Formula for Inkog CLI
# To use: brew tap inkog-io/inkog && brew install inkog

class Inkog < Formula
  desc "Pre-flight check for AI agents"
  homepage "https://inkog.io"
  license "Apache-2.0"
  version "1.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-arm64"
      sha256 "5278a29a5be56d44ef4028864f35dd56131e616d51deae711f5f11a3960c308f"

      def install
        bin.install "inkog-darwin-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-amd64"
      sha256 "8e6075fb04ecd1e73422eb580715b48fe89c4b65a302b3abedc68b5ca27e2c67"

      def install
        bin.install "inkog-darwin-amd64" => "inkog"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-arm64"
      sha256 "45160723c31a7ec3b0898c3865f6dfb42e2faf2c82ddeccb70c262167a1a2d1b"

      def install
        bin.install "inkog-linux-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-amd64"
      sha256 "a76a3762004c169b4c1cad930682cc1a31a1f8d69d1111cd118f45278ab51a9d"

      def install
        bin.install "inkog-linux-amd64" => "inkog"
      end
    end
  end

  test do
    assert_match "Inkog", shell_output("#{bin}/inkog --help")
  end
end
