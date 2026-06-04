class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.0.tar.gz"
  sha256 "ddd369b58d3e0e2091ea41db8cbda2c708796c99e6ba571651c19b94212cd861"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/agent.sh"
    sha256 "8b4e99a70401895f6c526561a05596e5782d2fdc1add3f6dc8ded5575c521e53"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/goagent-darwin-arm64"
        sha256 "e2d4d8f24cd18a717d26ef3abc61f9fef5bdc0d25bfbc583b11f45ea38d0d9d7"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/goagent-darwin-amd64"
        sha256 "7b955cb3fd64750609efeaf8f916637f622d3a071092822c2ceb7d91f5c1bcbe"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/goagent-linux-arm64"
        sha256 "399ce965d0f096de4953c8dcffb74930111256b642c4d5674f37840d8b345299"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/goagent-linux-amd64"
        sha256 "c0839118ec002a09772608786e9c8f8079ad861c98829c5a9110b90b37cdb0cd"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/rustagent-darwin-arm64"
        sha256 "b227f7223a1cb93c71d24f11c697b193c8d33d62b1cf847e8cccd2e1a2b2a2f2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/rustagent-darwin-amd64"
        sha256 "2d381430b19aa249a0e3b497bf9435d312e6de51e3b0e94c5d5dd5ea87a4acf4"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/rustagent-linux-arm64"
        sha256 "43cd119e878e5efd6d81224d893680d5535e89ac0e8d6e996acd562b3749255a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/rustagent-linux-amd64"
        sha256 "9e60b43b27b96d1d6cd34aef470f8617fa76418ca24038ef7f8476d44d008a1e"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/cagent-darwin-arm64"
        sha256 "ca7f4a43979096a44b7fe4cc568a7ce2f9a119509f167c1912bf5145c1add3f2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/cagent-darwin-amd64"
        sha256 "25f9f07a65bdf5e1f2bf76f5089e103d2c3abc4969a4cbfe6dc774b9e1e41a86"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/cagent-linux-arm64"
        sha256 "c098b0da53e13727b52780999a6c77dc0674ab91cac1d7892679a85f9e092ad3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/cagent-linux-amd64"
        sha256 "47ef8d7d04b83357010b5781dd094d43fe7afb4c4ac21fb519de4d5c07df5f0e"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.0/tcode"
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
