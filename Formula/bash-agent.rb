class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "11c684c1c17dcbd39ee81f2371000c70d91b6353f24e4706226d514096d655f5"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/agent.sh"
    sha256 "85dbbb50a869534367e26a0bba9f42bac940950a2e7ea8aff7f4cfe212cc980b"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-darwin-arm64"
        sha256 "1a6f4f93a55540f5ebc4395f0d4b92f86dd36cab22fd8d9806286c7ef660d3b9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-darwin-amd64"
        sha256 "85f3e4e8a57f7a8d9c75e60a3539bc694a42d7d82da7691887d93d213d93ce5e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-linux-arm64"
        sha256 "a3bd8a6433cbde35ce38bf1d5488de4626e1360ff1ff7e9250d16d4ce1d014be"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-linux-amd64"
        sha256 "452edefe1ac41302c9d39a83495e9d85ac407c8311b68774420f4b7a3b7f0a8d"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-darwin-arm64"
        sha256 "355607771dea0f4140c0c7abf65e6cfa3d685f4e3c119a190b74a9ebe4f2e826"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-darwin-amd64"
        sha256 "eeb8fb156611e0dee147583c2558facb95a6f99db83e5c91b13ff256816b723b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-linux-arm64"
        sha256 "0c35943db38eaeeee302c8ed4a8b913e0475ea9b42ef22aac6eaec2fa9f32759"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-linux-amd64"
        sha256 "dbe787d121e0268fde1ef83928eb5761e78f0318bd3bb2a2ad66441dcca6c119"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-darwin-arm64"
        sha256 "7944f53890b7cad95deddcea07a96be3ac062948174d265ddbaaddebec95929f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-darwin-amd64"
        sha256 "ec7b4ebf054a92272eec237cf8681a138a0e9f3534d698bc5c75a4662a78000e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-linux-arm64"
        sha256 "74f48cea15157c1c917f449fa1304c72174bceeeb21da0d741b1472bb644c5ef"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-linux-amd64"
        sha256 "e05bb06772d3f1781878f656fe6e42378e4f18e5afd32578acc79cdd855e2c31"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/tcode"
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
