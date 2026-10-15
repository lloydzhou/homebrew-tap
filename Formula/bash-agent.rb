class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.9.tar.gz"
  sha256 "5b2c9cc6980c15a8173047edd35dea637c428e2fd14fc58bc6ac92ed94913f41"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/agent.sh"
    sha256 "aef08ad6020d2b09c3f10416ff3177c96bf282555604c977f0cb6426a93db36c"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/goagent-darwin-arm64"
        sha256 "5971900c97f19254f1e4d3a8852263a836c2ec92613f7e64a19ce1d626cb598e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/goagent-darwin-amd64"
        sha256 "8cdc7d25b0c0521fc0c5d96078b11b32dacc19b2476d9c3a57c7371ffaac03d5"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/goagent-linux-arm64"
        sha256 "eef79378cf03844e307c12b4174e6674f8aea9bc3985530d13f6e929fa2c5da9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/goagent-linux-amd64"
        sha256 "2dc7fa9c318567e8406d8721c7fdb173470fa255e5a8776395c2af9966e797d3"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/rustagent-darwin-arm64"
        sha256 "8e22228877ad95db0c47747ddadb21a9a909a768e5c5ad481f4e246952fa6469"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/rustagent-darwin-amd64"
        sha256 "e51043f19e6430f87d778fd0f9ff4899f2afb1c5db77954f1c946275ae572569"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/rustagent-linux-arm64"
        sha256 "aab75093b5da516f970088146bb3fb25084b32bb4e5d7d74a55e761507329743"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/rustagent-linux-amd64"
        sha256 "5fa0366496a954276e9ff7b3a50968210a658f4c89979bf0eabdfd6c648f9d99"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/cagent-darwin-arm64"
        sha256 "4f38e9fb70bbac8037172ff9c5ae278836ef7a8f91d33e03c1d002cfa68f5919"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/cagent-darwin-amd64"
        sha256 "d6a8145a3160f3e70d2169dc2ee36983389b27c92988eb06d2bf0d4cbc553cb6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/cagent-linux-arm64"
        sha256 "9997f55d4c61ea7c0365af2b66e735f6e9a855ff25cbe5acf23e4acc24c4366d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/cagent-linux-amd64"
        sha256 "6883ae43793ff9492b8e6b1d7c8e41196c5a8ffea219dc0653e19b40c8496103"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/webagent-darwin-arm64"
        sha256 "b2bc7941124d604b1b6db5b2e9c62ad6f21f4798b4e66f81da87e4a4eb32b8d2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/webagent-darwin-amd64"
        sha256 "250cba663b486c84cb763b4f47e6d1ee0b3fc9375ec6707575874baa4b834a6d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/webagent-linux-arm64"
        sha256 "87357a957e044b9e3546762180e1c9623cb03b940f6184befb07c1bc1d103e43"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.9/webagent-linux-amd64"
        sha256 "0b1ee37ec897ca2a417b8f20bbaaf7b3395fcc6c8a292d1904f9dd2297083d01"
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
