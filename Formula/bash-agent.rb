class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.4.2.tar.gz"
  sha256 "e94fb99e9ae22ce16f3e86655f67e4bf7abc3e64f3903554ec906c81d0d65cf9"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/agent.sh"
    sha256 "bc10bde992631f4550b2fae2365dc0401731f819fcb0852cbaf664a2e29194b9"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/goagent-darwin-arm64"
        sha256 "23132f35c4aa02f39bfdfc2a24b88fcb5c2bd4372a23c5b63c24d2bd7303297b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/goagent-darwin-amd64"
        sha256 "0fe671ef798b2961405edfd2d6567479e88c2446e20d246189bb30ba5e8bc558"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/goagent-linux-arm64"
        sha256 "9fcdbfab0b41c58c98ba944985b0aa63d6fdfd945d3182adb0f7ecdf3fff64d7"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/goagent-linux-amd64"
        sha256 "2aff9c4b9e86ad8579ae3fce3fe56d186f7194a510d1a2a5328c1f0eabc3c383"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/rustagent-darwin-arm64"
        sha256 "d1e0828f80697776c04144bae1981001e4b1a6c7e2046a08eb8cb4c814b69faa"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/rustagent-darwin-amd64"
        sha256 "243afb7e07b352226048c94de51a1d6f9cc9a675c406476061d0021fe20d6aa7"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/rustagent-linux-arm64"
        sha256 "72d7059578734921a6b4e3ba267466b97d56127c773db885aa6d175a8402f354"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/rustagent-linux-amd64"
        sha256 "17f4fc6ad65c973eac6e2e14cd497d653ab187fec92df925fc419fafa0b33e6f"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/cagent-darwin-arm64"
        sha256 "d775662dc6786311fc47a4ed219320fb2ba124c8c3a0ea5ddd0132bc19aefd64"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/cagent-darwin-amd64"
        sha256 "09c46656e802d253fddce721a46d549fb73e40572dde6adb110bfc170699b0aa"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/cagent-linux-arm64"
        sha256 "a238e238f20b08355c60ec49749b6934cb5b1d43a9593706bd9f5916b5af09f4"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/cagent-linux-amd64"
        sha256 "a3981da3da38bc4ab3eda8393c9110f37d00249780c13330aec0882f78d0a16f"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/webagent-darwin-arm64"
        sha256 "4d942e20159efb8597e57816e4b09da11a81e9c867d763eefc6b706257c37d41"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/webagent-darwin-amd64"
        sha256 "ff01ee00a25c1a69cea30553b1f05985dd65a28174ba481d7fb5002e49c6fe29"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/webagent-linux-arm64"
        sha256 "561901d6a73e7175b41ce9827c2c6ed101e76962394841633853a0814435852a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.2/webagent-linux-amd64"
        sha256 "bedda5325314dd7fa3ff8107676430fd9bacbc8d8ab8a40de042e8721ab7c533"
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
