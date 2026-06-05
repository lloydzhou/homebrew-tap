class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.2.tar.gz"
  sha256 "615a76a7e84544362a51f93d6f9c5d0abc4630739f06d1b67fdd9272b5301343"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/agent.sh"
    sha256 "f032aae26eb2b2a0b10c144a2f8abfcf5a17eea378d21512f4d88280dce93907"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-arm64"
        sha256 "67c662aaf5d108c0dac677594596a13d59deb0ca65ef31a114d747f32547865a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-amd64"
        sha256 "efba85f846bf1362adb6aa0a3b5d1b352c19d709e778a409c192866e25d1a8ee"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-arm64"
        sha256 "d4c0c8ded3b5a6af4651b73066d9cbab50870fd1909b73f34d63b811c87c0d6f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-amd64"
        sha256 "69d1f58412ceb717fe076018b3ebf4cb28444952f8280add50c5cf69b6ad5015"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-arm64"
        sha256 "081459191ca42b41488de25b847207523646a86e05c1eea48ecc97a2316f41ba"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-amd64"
        sha256 "326a45f3babc5cddc311180432ba1e73e79f7a6b6167abd420a0ef2373fc15a4"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-arm64"
        sha256 "ff85691b22ca5cb2515c12ae0aaa747b05b1eb8c22e8d4ea7158fa86a170914a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-amd64"
        sha256 "9621e9474c5a8ea9c1588c070c1902cbe735bf848fccb343758e5212273168a9"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-arm64"
        sha256 "ce3ead53d1542dca18ba103ab18f64ddeea480153f5f242995fd1acd36310502"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-amd64"
        sha256 "7d7867ae5f46676205f2758b5cb2c6602fc91410f01e65d949983978c8b208cf"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-arm64"
        sha256 "dcf342398750470f24ed75fef38a7546159f7c092f8e19a74ea80cfd6b06094b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-amd64"
        sha256 "7d75abeac3a5c0eb16d2dbd85d5f972e5f053abc4aa05c49ca3df36da548c315"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/tcode"
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
