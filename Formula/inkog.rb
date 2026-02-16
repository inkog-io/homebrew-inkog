# Homebrew Formula for Inkog CLI
# To use: brew tap inkog-io/inkog && brew install inkog

class Inkog < Formula
  desc "Pre-flight check for AI agents"
  homepage "https://inkog.io"
  license "Apache-2.0"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-arm64"
      sha256 "394167bc1ca1b1ec4a1504ef188256f118df437b9d4a67239132b7a07bce1800"

      def install
        bin.install "inkog-darwin-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-amd64"
      sha256 "261bbb42917b2d0a585573d84fe94c32e9327e5c474c8d5ad6f6ad3ada0d9db9"

      def install
        bin.install "inkog-darwin-amd64" => "inkog"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-arm64"
      sha256 "7324f7a859660bdabbced2f5d72eaa683f7de4e21188c57c22376ba4e0f4f01a"

      def install
        bin.install "inkog-linux-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-amd64"
      sha256 "3815338e1a97209510c1f6977d3b4fc5d7f362d64d8399c920d9d309f1d6ce31"

      def install
        bin.install "inkog-linux-amd64" => "inkog"
      end
    end
  end

  test do
    assert_match "Inkog", shell_output("#{bin}/inkog --help")
  end
end
