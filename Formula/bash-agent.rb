class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.2.tar.gz"
  sha256 "1936151c7870e894d35dbf2a2473d56eac10b059d9e09c88f6d712aca6fa7fb9"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/agent.sh"
    sha256 "85dbbb50a869534367e26a0bba9f42bac940950a2e7ea8aff7f4cfe212cc980b"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/goagent-darwin-arm64"
        sha256 "fadb8cbbc3a8e6618e4add0be1138ecf8c96e0d1f6d8c4a0078d3ddb62bc3f17"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/goagent-darwin-amd64"
        sha256 "7927ef0737c6fa4b53f5dae041485a43de74ef0090dd5ea7f66d560662e7e445"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/goagent-linux-arm64"
        sha256 "46c3912474ef0a053996626bda51f836d2bddfa3f32945f3fb0020cc989892f7"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/goagent-linux-amd64"
        sha256 "6d77058ac84385bf3412baf97374b32fce047c988c9be661ab8a0c62391aeaa9"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/rustagent-darwin-arm64"
        sha256 "a6d902f772010a3c2838f32486482219684aa75df734f21fadcfd5016187d942"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/rustagent-darwin-amd64"
        sha256 "d27822bacb0936481bb6ca3e7f04a24ddb617126564cc3a0564f6a8b5d312551"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/rustagent-linux-arm64"
        sha256 "1ae14e7ec39ecd11ef358d1dc4a66c69cd479da12a088b080c137e58b53273e4"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/rustagent-linux-amd64"
        sha256 "85d4d664870e0d5608d868b200069c6b3a0971b73eff2bdd1e5fbd737f188d32"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/cagent-darwin-arm64"
        sha256 "53eb0ecb00e76633a76053e635469d872176c4bc216a5122d4469ea56b007dd9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/cagent-darwin-amd64"
        sha256 "d0a11837f36aa69ef11b130395770dc9e9b2c8cfce2423b83657d9bf2b9d8487"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/cagent-linux-arm64"
        sha256 "007a78e15b25aa780d752ee81859f3fb8878185703b38e8ecd29906d5b808c07"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/cagent-linux-amd64"
        sha256 "8634a25d0b6ce18880661d2c1fa50e76e6d6210034227dff69a61c7e03897c90"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.2/tcode"
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
