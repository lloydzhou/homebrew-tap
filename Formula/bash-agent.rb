class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.4.1.tar.gz"
  sha256 "ffe3a814291db0d42a97d29b10f0be20c78706d62ad05c343c06c0b97cf25c90"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/agent.sh"
    sha256 "752b1196f2e1dcbcd8474cbe25633d419eef7108d2769406ff1ff400a26ee20e"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/goagent-darwin-arm64"
        sha256 "1fb1c17f625d9017847af8494166bb378cbfe8e2e29f4f869e7381c4a7b80ec2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/goagent-darwin-amd64"
        sha256 "cdb08d8ebd4e9b32e5412337d8b886cad9d2d63d79ce8cffeefab17b5e06e4f4"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/goagent-linux-arm64"
        sha256 "64b59a3cc609fb73cf285136f20bb76f8b29d2aace4ce8b5c405456f3f5188ec"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/goagent-linux-amd64"
        sha256 "98a56d4db611617d8ea24a83a18b1d5bfb77a95871145243263c4636ca2b68b6"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/rustagent-darwin-arm64"
        sha256 "5975cf2ef036bab0af54f7fc84da524bd41108f8526b21e4615896c891eb5986"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/rustagent-darwin-amd64"
        sha256 "7cf257805b1ebc48f1aebc5be56cd4bbd4d66885d7a18a7f7e159c0d1a5341d7"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/rustagent-linux-arm64"
        sha256 "01bf83f498bbcf1eb4048cb5b73cc324e797adcafb5b439e3313730b877a3431"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/rustagent-linux-amd64"
        sha256 "0b85eafc060dd6261f7918d26beab1bd768c2294724fb66b863f30cbdc436984"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/cagent-darwin-arm64"
        sha256 "0c2be9d2f919ccf6b42a65e382cc08ae6b8b62f560529b7c77ee0a735d25ea6a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/cagent-darwin-amd64"
        sha256 "efd6fc6efda9ad35b2fed6292575167f587d5db8fd3b05234e2ddb14736b39a5"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/cagent-linux-arm64"
        sha256 "7fae101f4a36101de024cf3e5b3ba3fb796fafaf146908fb0c76e228fd25fcc3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/cagent-linux-amd64"
        sha256 "8ec9de00031e235038fabdad2a32f4743e55757b1d4099a846772e6765834dbd"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/webagent-darwin-arm64"
        sha256 "9692a0c39bf3e237fcbb8a222e81a6a0a9a4b22294902d73f85263420441e34c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/webagent-darwin-amd64"
        sha256 "f84ec5d2fecfdb2f04f4aa06fc8703b53c86e09fed1ef87d1909aaf88fd52fd0"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/webagent-linux-arm64"
        sha256 "2ed67c427bbb06a494f66399102f3e0af46f3d8b003f411745fc5f6a454e48a6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.1/webagent-linux-amd64"
        sha256 "96b64ec32357a71c8ac27e45970617a6bc677f598b90a5b7b3a1b1d0394924f6"
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
