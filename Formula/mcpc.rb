class Mcpc < Formula
  desc "Standalone Model Context Protocol (MCP) client CLI with a persistent daemon"
  homepage "https://github.com/lloydzhou/mcpc"
  url "https://github.com/lloydzhou/mcpc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "86a53f963420197c94c3f3ed2c934fd1ec401831804a5f52c218a2f7d0e95632"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.1.0/mcpc-darwin-arm64"
      sha256 "3e34b7816247c8e84234bb60c70fd55fb3b5b44cf0eb1bebc37bd166a0eb60a1"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.1.0/mcpc-darwin-amd64"
      sha256 "5c4e1ab114945d15b6a063674a5bcc992a34adcd61fcf8b3089559d2f263d3c1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.1.0/mcpc-linux-arm64"
      sha256 "9cd36f5db027d71722af99ecedde62abc24fcea70329f09aba8b7ebf09b64bbf"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.1.0/mcpc-linux-amd64"
      sha256 "9990695617b6ed5801ec610b52a5d21811c692a250f78ba659c0d042712d911b"
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
