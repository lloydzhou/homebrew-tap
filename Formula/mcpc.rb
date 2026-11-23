class Mcpc < Formula
  desc "Standalone Model Context Protocol (MCP) client CLI with a persistent daemon"
  homepage "https://github.com/lloydzhou/mcpc"
  url "https://github.com/lloydzhou/mcpc/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "c39b8545501883ee39e861a45ee1bd9476bec391886169cb300a82159060e62c"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.1/mcpc-darwin-arm64"
      sha256 "6898cf28ab6d689949aac17bc943327e5a9ab2be326b254e54fe522960100622"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.1/mcpc-darwin-amd64"
      sha256 "7d86e7ea894113dc50a9bfe296bb8342385b5b99d6434855d1e60fae399a2a5a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.1/mcpc-linux-arm64"
      sha256 "1f6de84e7bd4861a1d04c68555eee48939e188fd7164e522702555c9414ccf41"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.1/mcpc-linux-amd64"
      sha256 "d3d41bb562c97a9a2001e01d51130e1cc49861783a0a2d35ccac8a17b1969c86"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpc"
  end

  test do
    assert_predicate bin/"mcpc", :executable?
    assert_match "Usage", shell_output("#{bin}/mcpc 2>&1", 1)
  end
end
