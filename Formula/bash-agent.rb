class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.7.tar.gz"
  sha256 "5b2c9cc6980c15a8173047edd35dea637c428e2fd14fc58bc6ac92ed94913f41"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/agent.sh"
    sha256 "3315e3f2a817f001b4405b2e7edd5d32f0511d94346cc0fc5ed15194b9180f11"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/goagent-darwin-arm64"
        sha256 "0636de235e33aa50b6fc8c0adf6cc00903a0e23cdadceec235b5a3441b7dd2dc"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/goagent-darwin-amd64"
        sha256 "416f46558200a8dcb6f7e1c9606296ce384b0cc034e9dbdc85dbaadb7685ecc9"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/goagent-linux-arm64"
        sha256 "2393085ea35f212a0970f16e1f1db9620410bb7e597cecc6d74dd0435b98976b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/goagent-linux-amd64"
        sha256 "f1281c037d4c9627a48259baec699253aeaeec0281586ce96836dd3839fe7bc4"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/rustagent-darwin-arm64"
        sha256 "724a47a524eeccad9e1eab613b324caf6e357b20df47fb481455e5241ecfc2f6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/rustagent-darwin-amd64"
        sha256 "b0ad14bfe0f641d77c338cd4e561e38a8327559e284914c6b4c219d0c07a98a0"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/rustagent-linux-arm64"
        sha256 "f7f2e68500b1cb68cc84b51f447b0bad5133005b2040a7358ef16173494695ac"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/rustagent-linux-amd64"
        sha256 "11b68526778df456abcb1997f12d1ff95904bd5cb608268bc00a22e9de1f94f7"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/cagent-darwin-arm64"
        sha256 "84bcfc169b1d17851c74b6a572ae9c75e6df000579d5aecb8b835d7a8af060c1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/cagent-darwin-amd64"
        sha256 "10a0f084a5ec09376903ed08cb697485bb00583f6cbc0b4ea375d0acdada20e7"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/cagent-linux-arm64"
        sha256 "8e7a8ec783eb451d2040593233d10bf1e34b7c9a045d22134719b08777a11248"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/cagent-linux-amd64"
        sha256 "dbbe833981d194c7aceebccb11da3a00d247ac9adefc96ac8407dfa1b8417d13"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/webagent-darwin-arm64"
        sha256 "01570c6e870146b4768a3563dfc00debfa00f2a8c76f69d10d2ef8b42ce7af82"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/webagent-darwin-amd64"
        sha256 "bd48745aed3219c635b74c8b130f6f3c38ff6aed2871b5d2417f36fff1f2966e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/webagent-linux-arm64"
        sha256 "9271a0efbc2eac956ed107568c9c8433b016082f6379d3a24181d57f6c3943a9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.7/webagent-linux-amd64"
        sha256 "9381d25d199b88b9c09ab9fa8fa7e157fae7efec7e9b01e2dc9cd0d5fa4e6bdb"
      end
    end
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
    resource("webagent").stage { bin.install Dir["*"].first => "webagent" }

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
    assert_predicate bin/"webagent", :executable?
  end
end
