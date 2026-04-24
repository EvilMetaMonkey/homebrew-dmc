class Dmc < Formula
  desc "Local shadow-history version control for AI-assisted coding"
  homepage "https://github.com/EvilMetaMonkey/dmc"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/EvilMetaMonkey/dmc/releases/download/v1.0.0/dmc-v1.0.0-macos-x86_64.tar.gz"
    sha256 "PLACEHOLDER"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/EvilMetaMonkey/dmc/releases/download/v1.0.0/dmc-v1.0.0-macos-arm64.tar.gz"
    sha256 "PLACEHOLDER"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/EvilMetaMonkey/dmc/releases/download/v1.0.0/dmc-v1.0.0-linux-x86_64.tar.gz"
    sha256 "PLACEHOLDER"
  else
    odie "Unsupported platform"
  end

  def install
    prefix.install Dir["dmc/*"]
  end

  test do
    system "#{bin}/dmc", "--version"
  end
end
