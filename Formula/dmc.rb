class Dmc < Formula
  desc "Local shadow-history version control for AI-assisted coding"
  homepage "https://github.com/EvilMetaMonkey/dmc"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/EvilMetaMonkey/dmc/releases/download/v1.0.0/dmc-v1.0.0-macos-x86_64.tar.gz"
    sha256 "deb3cd89f7b04fc625df6a6781b3ea3172f4f85501f3ea45fde6594975100641"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/EvilMetaMonkey/dmc/releases/download/v1.0.0/dmc-v1.0.0-macos-arm64.tar.gz"
    sha256 "188ab192397234f103d9b95a64bcbbc1c2e65ed90fa8f6563d7e564e3e15a090"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/EvilMetaMonkey/dmc/releases/download/v1.0.0/dmc-v1.0.0-linux-x86_64.tar.gz"
    sha256 "e222ab11e89750a5163a85f983e3605185afcebcc5e8e25a180a55d33cc2c953"
  else
    odie "Unsupported platform"
  end

  def install
    bundle = (buildpath/"dmc/bin/dmc").exist? ? buildpath/"dmc" : buildpath

    bin.install bundle/"bin/dmc"
    lib.install Dir["#{bundle}/lib/*"] if (bundle/"lib").directory?
  end

  def caveats
    <<~EOS
      macOS also ships a system command named `dmc` at /usr/bin/dmc.

      If `dmc --version` prints disk profile commands instead of
      "dmc version #{version}", refresh your shell command cache:

        rehash

      Then confirm Homebrew's dmc is first:

        command -v dmc
    EOS
  end

  test do
    system bin/"dmc", "--version"
  end
end
