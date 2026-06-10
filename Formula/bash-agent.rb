class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.5.tar.gz"
  sha256 "002800ed6baf7b059b4827a00467d7b47b0e21f2d343bca49c6c2dc6b0dd22fa"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/agent.sh"
    sha256 "9322ed798675d73b9d0676c7299350269e0e706245f59227893deeac6c19944a"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-darwin-arm64"
        sha256 "3c0f6206d57bdc882eeb75e230766b81ab21138cdf1d0cdd15000b95240aeef6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-darwin-amd64"
        sha256 "0dbbbc4c6d3f7d1fc8a044d21d8e6eb73595511e00896e9298cd8cf5f2f63707"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-linux-arm64"
        sha256 "7139b8a0b46a1f1905fc1837e6808ffaf5409e56e3c110a260cd6b5d1f5bec47"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-linux-amd64"
        sha256 "fbc930a1c4117e946cc4d587dfad6f56c377c848628478edfcb259fa6d6c1c22"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/rustagent-darwin-arm64"
        sha256 "e3bf373ef9ee39c61c508e0f8653faa268e6f390ae0bf29f54c4e80028d209a3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/rustagent-darwin-amd64"
        sha256 "d4a2b5d7339905c35f03708e489f3c01fcb9a2a6c120ee9865d3067ed1a33e9f"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/rustagent-linux-arm64"
        sha256 "6e92291b35d0dbba8624125ce07747df3e61305279a0b18ad5b7bec257e9a40c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/rustagent-linux-amd64"
        sha256 "a97cdd55bb762cf3ec91051e9f1218303cc2d8783ec0556cc5723a2ad67fea6f"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-darwin-arm64"
        sha256 "80494c36b27234576afd42aa181333a2379a626a55ac96c13d2c4cd0a9f980bf"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-darwin-amd64"
        sha256 "8e58c6d92308d5e7888edeceab3c46ed62434f5bd5029df2e389b8397bae1b46"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-linux-arm64"
        sha256 "970300f7bddee94349fb2b30e86435ab05338da83f5a3df41b498d917424808e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-linux-amd64"
        sha256 "f3e53dd34e9f1c6f0847e59968a0ec317f7327d8f6dd0af78b503a6d4c4cded4"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/tcode"
    sha256 "74aabd0135a1a8e2d0d399e372df8023f257552f84bba7fb3a459ba5f3962ae7"
  end

  def install
    resource("agent").stage { bin.install Dir["*"].first => "bash-agent" }
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }
    resource("cagent").stage do
      bin.install Dir["*"].first => "cagent"
      bin.install_symlink bin/"cagent" => "ccagent"
    end
    resource("tcode").stage { bin.install Dir["*"].first => "tcode" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
    assert_predicate bin/"cagent", :executable?
    assert_predicate bin/"ccagent", :executable?
    assert_predicate bin/"tcode", :executable?
  end
end
