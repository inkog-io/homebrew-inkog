# Homebrew Formula for Inkog CLI
# To use: brew tap inkog-io/inkog && brew install inkog

class Inkog < Formula
  desc "Static security scanner for AI agents"
  homepage "https://inkog.io"
  license "Apache-2.0"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-arm64"
      sha256 "0109ffa08f408470aac1d506b3e7124824bef14d316fd31f0f2d6c38ce672a34"

      def install
        bin.install "inkog-darwin-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-darwin-amd64"
      sha256 "e7f4b0572db6e46700f4837a4cd4386ac3757b4fb5b14ca2b7a31cfa9a045504"

      def install
        bin.install "inkog-darwin-amd64" => "inkog"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-arm64"
      sha256 "a55ad118e86aca11954e2fd200bff90c28b0c827b47d941d065dc994c22abac3"

      def install
        bin.install "inkog-linux-arm64" => "inkog"
      end
    else
      url "https://github.com/inkog-io/inkog/releases/download/v#{version}/inkog-linux-amd64"
      sha256 "f51959327e8a3809cfc058abc84e8aa3f9442a8b6482cd2001b3adcaf2c87a96"

      def install
        bin.install "inkog-linux-amd64" => "inkog"
      end
    end
  end

  test do
    assert_match "Inkog", shell_output("#{bin}/inkog --help")
  end
end
