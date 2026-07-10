class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.17.tar.gz"
  sha256 "0bcd83a41c1c77a55b43345118e941fb644b50a0552f73ce0a431dd66c55cf5c"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/agent.sh"
    sha256 "b4d82cfd6c9f18978bc75c5668f345db18c7d9a9a4030bbaeb705d280ef4308e"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/goagent-darwin-arm64"
        sha256 "2a1a8ebbcacdcf131a34e7233b789f6af9e5d92c2d9d5c57d8771830fe3dfe0b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/goagent-darwin-amd64"
        sha256 "bdb5e040f5f64d9b116be6de4adfdc1eaf93988410c95dc95d58f542295d59c9"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/goagent-linux-arm64"
        sha256 "b46fbcb0b692f78bfbef243f3d27a54033a1798e6dce3a097029fc4617193503"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/goagent-linux-amd64"
        sha256 "0ffd574d6b4b34f2ccfeefad232716c2b5ebdf933bfec65aa8ada7e818a81615"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/rustagent-darwin-arm64"
        sha256 "bbffebccaae887f41f52d032fadeae9880b2cd4983b79c6a6801bca4d4792ac0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/rustagent-darwin-amd64"
        sha256 "eed7a164130abc07f725d1a7fb855f4d512ffdfcc1fc98bb2ad1e44f056d0008"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/rustagent-linux-arm64"
        sha256 "8814d074582559dcc12ab0b06efa8d3cb09207ef87ea51d55b44b1b641c7ecbd"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/rustagent-linux-amd64"
        sha256 "8703bc43b178c53f0dbb5d13c8bd35f1b6835b1ff3e0858bc9fcbd35daf706eb"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/cagent-darwin-arm64"
        sha256 "3939c3c850db9fc1e804e08679775d479e4c2d4358e6e389ce67a269c61482c0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/cagent-darwin-amd64"
        sha256 "ff6ac80ca304cba1dcbf1df6d3f0593dd8e12d971934389f77d7bdab8ac8d14e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/cagent-linux-arm64"
        sha256 "da3e9d192edcdf80a517d442373f3ea7d5eff9aed35a52299d6117919f0aad57"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/cagent-linux-amd64"
        sha256 "03cdd9ec611709bda24229f13a2fa94ad0f1f824977ea27bcda26a1fdf381a34"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.17/tcode"
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
