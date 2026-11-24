class Mcpc < Formula
  desc "Standalone Model Context Protocol (MCP) client CLI with a persistent daemon"
  homepage "https://github.com/lloydzhou/mcpc"
  url "https://github.com/lloydzhou/mcpc/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "1a6572bb6ac177fbe2bff0f6c8f0fda970da6cb2e648a62b3ed7b1774994ec2e"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.3/mcpc-darwin-arm64"
      sha256 "fdc6e42625d023b192ef4dd72f3a71a7f19ca59180c3f9f3a65f1880df6e242a"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.3/mcpc-darwin-amd64"
      sha256 "3981abe99a04d696c739e1e3b2922c31f022c0606f9bea321cc0438f39a69f86"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.3/mcpc-linux-arm64"
      sha256 "8578b1fc54b00975d27d8452a41f337c2fa816c2cf322ef8bdbcdec432e6365d"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.3/mcpc-linux-amd64"
      sha256 "6369ab132df34351c09c8229a42098edca2c98750eae82478ff9c4be910a3979"
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
