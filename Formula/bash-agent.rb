class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.5.tar.gz"
  sha256 "f62a8fe1ed99873d36ca2efba775cb46f86bbf219d5965fbac8fedb58f114a31"
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
        sha256 "e6b8e90d39ec245d5bda032d529dfa6d8c4f7513075c647994d63a5b1b8ef777"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-darwin-amd64"
        sha256 "286a12cce7a5393a73e6564e68cca530cd818af811785d15373b1777e1d1e581"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-linux-arm64"
        sha256 "307feb2651bc320557f5268e25fb820046860d47d63b006557a69789c6899a18"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/goagent-linux-amd64"
        sha256 "c923084a99b33b7d5c75a5af03279eaa045f69f8dd8b7aba24c05bad11e60753"
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
        sha256 "9e004072e0a348d0f9ae2d54d3e3c0230c63fc5416d1986bb699519a4890cc16"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-darwin-amd64"
        sha256 "cdcb6c4ef4a48537e7008e9bb29c1dcae2b9bbe7e9d2864088a2ebcde0847405"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-linux-arm64"
        sha256 "c87ce1d68e0fb2b914bc60b12508198aaa57f254953ca43942fa4443d03c1384"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.5/cagent-linux-amd64"
        sha256 "6b3632dee8fb3c6b1f4c750f0fcf20ae736818c844036fd2563aa66b9057db01"
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
