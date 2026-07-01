class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.12.tar.gz"
  sha256 "99af5f9131a8018468c876511ba8310567b6b5796a0c5fc64d991c15ad99be10"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/agent.sh"
    sha256 "3c8c0a341f65070378e5eb918223584b1a9432f5b0884a8e65169d6469b894b3"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/goagent-darwin-arm64"
        sha256 "7d939b67ddf9fadc9b90f796d1213a799e07579d8009bc73eeb6b9a308914bfd"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/goagent-darwin-amd64"
        sha256 "53f1382d63b4c12a4b296f1f0436fa82dede8525a5035e32e20f582011b972a5"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/goagent-linux-arm64"
        sha256 "0735b98938ce64322390a507114d02eea6225edb8b6ac087b510e473c329f1ae"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/goagent-linux-amd64"
        sha256 "01edeb08b074a1659daceea6851965eef2136477a028c033eaf7e9fec169819a"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/rustagent-darwin-arm64"
        sha256 "2cc913886f6755f288d953b6136770640072d9f89917d647e866224f150f9dc2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/rustagent-darwin-amd64"
        sha256 "81ed7a9b801359d8b4fe2d31bb225c6498d73a3ae20f7fbd00aa0f575d6a3b9c"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/rustagent-linux-arm64"
        sha256 "e0ad2983817d2149a8ea3cabbb04eba081007685ae9b180bbc9b175901643a32"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/rustagent-linux-amd64"
        sha256 "43080ef7156b1bcebd7064b9345662c40bfe2155df83cefbb6e5a860b7532f90"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/cagent-darwin-arm64"
        sha256 "8b78555c10786e8503799dfb5adab501b6951a7c9c5cedef24a6318d94cd4aca"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/cagent-darwin-amd64"
        sha256 "9ac7ea31f39d699e6742d030cd95a9a42dc11dc00fbf146d4b33d6f3d31bd436"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/cagent-linux-arm64"
        sha256 "3decbbe84e576cf2c3ea77caf1add78f35e687e824769a1e070a950ed6acbfbf"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/cagent-linux-amd64"
        sha256 "a8627fb6bfa3040d5dcad532195f4a5075d79f1f2455912a0f21ef9dd5de555a"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.12/tcode"
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
