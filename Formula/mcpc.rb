class Mcpc < Formula
  desc "Standalone Model Context Protocol (MCP) client CLI with a persistent daemon"
  homepage "https://github.com/lloydzhou/mcpc"
  url "https://github.com/lloydzhou/mcpc/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "e1e61e79cf91cad8a5369e6bb6115dabadc4d2e68a009853ecc6d31544d738d6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.2/mcpc-darwin-arm64"
      sha256 "8745abab09b2ce44759ab7e99a6947a3c4c42f378baa0966e4be00c4175d4c55"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.2/mcpc-darwin-amd64"
      sha256 "fa3b6da2235a99694889d715f87cb1f93fd05a4fad5f217209a44861e4bc6827"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.2/mcpc-linux-arm64"
      sha256 "9b072c8eee221345f4e76a355d9ab82aca2d2656ab24200fa152c6639a22cb30"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.2/mcpc-linux-amd64"
      sha256 "d3b4f7ba8ab8ce1c1c954f50d482fc6d1bbefa011934ee29a14cb04a73790db1"
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
