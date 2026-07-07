class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.15.tar.gz"
  sha256 "dc2edb6d67d4ca7e9fb63828ada1d88d8764e4c3bc9fcb5ad21018b42270e5c3"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/agent.sh"
    sha256 "b4d82cfd6c9f18978bc75c5668f345db18c7d9a9a4030bbaeb705d280ef4308e"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/goagent-darwin-arm64"
        sha256 "83407f030353fdb31fd2df87288d465a57ce9235f12e6b3d50deca6de3a10c21"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/goagent-darwin-amd64"
        sha256 "9a0ca339f899f274d3f3c085988b868cbba0bf892ff8a35bae1e8047948ab32d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/goagent-linux-arm64"
        sha256 "5c6773fc8d546a90f7f10017999c8af3e2486eb101b9e6fb18420eadc6ed86a1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/goagent-linux-amd64"
        sha256 "054583e69c288b7562a8e91beffd87a47973f54c8cf8a7757c4239afcb2092b7"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/rustagent-darwin-arm64"
        sha256 "3c88d82a490b37afe42eb6e7acc3993b6e69a03ed6551896f3c6cfece88ce6f8"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/rustagent-darwin-amd64"
        sha256 "c8af7d5da2a06b129e91607c4ccf596d4efd4a656cacf28ae1efaacf828ed2a6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/rustagent-linux-arm64"
        sha256 "27053a86cac38978f5989f826f8325cc88dda455ad8e6c99613ce3bfa3acc599"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/rustagent-linux-amd64"
        sha256 "6c908beb07fbd6b7f2822908afa8bf09784e21c62701f524679e2027c53e5fb4"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/cagent-darwin-arm64"
        sha256 "82fdf603aedbfa2f935e3611b9c0131c78693d8dd97f895a38f1417cf8d0a60a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/cagent-darwin-amd64"
        sha256 "1195b7d77ec693c359b2a561c2dbb47c8d57eff267bdefdc5ab0bc980effa22a"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/cagent-linux-arm64"
        sha256 "aed0747e9fd509a670623bef0da853451e4229fb47547e80e85eca49082f0291"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/cagent-linux-amd64"
        sha256 "bb895689ab84ae26b546de0d7831c09213eae5f88fc03846a0b27cfe967f95bf"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.15/tcode"
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
