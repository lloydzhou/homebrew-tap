class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.4.tar.gz"
  sha256 "716cd3ae0c99b2c9f0811859e9c3bb59813cf1a0957b3a88fc54cb14522a2495"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/agent.sh"
    sha256 "273de48c3fda9d979a46a5153bf89c77226657bd7c9aff0967d81642749270ed"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/goagent-darwin-arm64"
        sha256 "8165280a01ab1d1ac8c2a44dedbc9b280ae5545da97348aea5ef58775cd62eb0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/goagent-darwin-amd64"
        sha256 "9d3bb6612cc2fd0b5cbfe1abe62418fa38d74c1e61638638d588da6b2b1ae07f"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/goagent-linux-arm64"
        sha256 "3718ab4105b104ff6d271411d6e06bf18d9e802e7fced339ed96732ec3821768"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/goagent-linux-amd64"
        sha256 "7cff2b521c9c4cc2f0b97e0c228d638e0ebb4bff82ac2c041570777a0cff8730"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/rustagent-darwin-arm64"
        sha256 "e65e1842accf516f38f78d448d825e5a9eb31794d0360102fd49773fce0ac0a4"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/rustagent-darwin-amd64"
        sha256 "56811b4c2ae7d31b24b06c453d3e764ab22c7b6e70123b668a543cbfb9dee778"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/rustagent-linux-arm64"
        sha256 "29b183849f522edb507c0edb3fc17f4b436d456702f5c322d88a66bd0fb9fac1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/rustagent-linux-amd64"
        sha256 "51ea13684135f11312a841b61a37eb974a3188ca1922e3a9e2880ee5ee34e0e9"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/cagent-darwin-arm64"
        sha256 "5f8453f3b1c82075835bf7ea07519dd9ca740f9b241ff7a49827d7a55f42a3f2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/cagent-darwin-amd64"
        sha256 "12f32b6a62e096c5b4bd776bbc568ec094835aa1be362abfc4ad36018951cc5c"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/cagent-linux-arm64"
        sha256 "197569ab1dc5226943521b835babf3f496b29ce0a16ee4fef63d363ade805ae8"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/cagent-linux-amd64"
        sha256 "d311193090ddef8134b78f06585652ff835ef0ed1c90c798c741be8e47f69f5b"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.4/tcode"
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
