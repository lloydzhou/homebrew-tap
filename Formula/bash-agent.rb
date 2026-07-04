class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.14.tar.gz"
  sha256 "71626cf03eaa18d6ed26264562213a9e48fc0bc8244d26a41bc31a7cbba3ebd0"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/agent.sh"
    sha256 "d16e7bd559d6d0b0bf4cd14facd8d6891f68a0183a7df5505bb52b6b4785e955"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-darwin-arm64"
        sha256 "4206d49b4ec52abafe2f5a9a573215c56b949a89b0562d03e7b9bc4db99eb722"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-darwin-amd64"
        sha256 "a237dfe21e62522857d658ba9073f69db1a1b933f1e44eff7b30d430ab0bd741"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-linux-arm64"
        sha256 "4f56d13de48522da270dfa5e20e20eea02abda0c8cac8091c170e97864a2a5f7"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-linux-amd64"
        sha256 "c554abc8ee5d0884b98868f5d06646658246da7cd6a50ce63dc5fd862d1ba31f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-darwin-arm64"
        sha256 "01d4e0ad16c0d4275a371936d6e0fe5bd236d4f3b8743fdd232d628b9b4cc6a8"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-darwin-amd64"
        sha256 "b89aa309049657348654c32cda42bc49b25a3469ef38d8e0b711c307ebf96ca2"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-linux-arm64"
        sha256 "13e160b5053bba0848b82ec09e2d05c106aa072977b4b0b9d6cd036030d224e0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-linux-amd64"
        sha256 "20f5c54fa9eb14f167b29b33c2d9e4f6d7b969d88573ef772326b1bc4b3a45e2"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-darwin-arm64"
        sha256 "d81a14916fb2cb8e8905beae1418e993f9dda0705d850933f9659541cb383c71"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-darwin-amd64"
        sha256 "e28cb833b44d5b45376809898de2a99bba802ba14d159e81618baa740cf2112b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-linux-arm64"
        sha256 "982a25740841d4492f617ef42cf41773ac1359fbdab39c8b18a4a8743e82346f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-linux-amd64"
        sha256 "13d3e39645bf9e7523daed26685a6023d5504f119a239ed1e205b52d477f792d"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/tcode"
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
