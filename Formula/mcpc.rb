class Mcpc < Formula
  desc "Standalone Model Context Protocol (MCP) client CLI with a persistent daemon"
  homepage "https://github.com/lloydzhou/mcpc"
  url "https://github.com/lloydzhou/mcpc/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ecccc29d1e5fdbac101127b7a54fe5e2208e2d99ee86e3657746f317c83ebadb"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.0/mcpc-darwin-arm64"
      sha256 "83fa3f3fbe42272c97223894f73ef550951ded2caffb84362be841fd0ba3ee13"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.0/mcpc-darwin-amd64"
      sha256 "9d291942d93b0ed55ed3d5bfdce9f528f8676242190f3bf9855beb744fae97e9"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.0/mcpc-linux-arm64"
      sha256 "a7e6423da09ad6868541304c88c97e72ca14ba6acb5dae576cc221a81fa90761"
    end
    on_intel do
      url "https://github.com/lloydzhou/mcpc/releases/download/v0.2.0/mcpc-linux-amd64"
      sha256 "5730fc6c7a1c2c4c2e778686d8e399263738e8e9018a247b1a1568fc62d340ea"
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
