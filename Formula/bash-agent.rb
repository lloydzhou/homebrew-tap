class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.4.4.tar.gz"
  sha256 "f9819a7bd609fc9e96c7aae321caa74c87a645ddcde1e94750fb2ebc3c2fecc1"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/agent.sh"
    sha256 "55494c1cfdd2de57d38f17dfd32ea667f26764a2f8bdabd3fdfd0b478b984e35"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/goagent-darwin-arm64"
        sha256 "c32cb5ad2cdd1c131964b658b0dbc038cd18421425c3ba9afcf19de0db7b9c88"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/goagent-darwin-amd64"
        sha256 "7c766580cd0d413ca84a7d09d433d9e2c27488f764867ddb4c9d6b4846850d98"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/goagent-linux-arm64"
        sha256 "83039d3ceb69f46bc46064963f0210f5c5df1d252ed6ac662714393d284969ca"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/goagent-linux-amd64"
        sha256 "834852bef3dd5d000fafe54d6ba48f827721d9a2af4d9001aacace61c1cfbe37"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/rustagent-darwin-arm64"
        sha256 "d400fb280656940739c98be850fc152f02facd19b69d4c37b3e198912c68097e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/rustagent-darwin-amd64"
        sha256 "09f804bb193fe45e8a8cde01ad891fadde4d6721fc5d7aa96d8973a8f17f6416"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/rustagent-linux-arm64"
        sha256 "c6af1d287b86c9aed1ac3e6880e38e0c5b0178e62ab6fcb28e4630bf4d50657d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/rustagent-linux-amd64"
        sha256 "38104498fc7cba51507e48347163817ca882b8369557d1018d2d44e62afdc6b2"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/cagent-darwin-arm64"
        sha256 "2e6a028bd2a2c4e1b421d7c2814885f7c90832d8ea2d888a4fa3ebb5afa23339"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/cagent-darwin-amd64"
        sha256 "bd7df5b8b4f2abecdd91d12d9f4628313be906588b5d52b1d82819c1dc9f94b1"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/cagent-linux-arm64"
        sha256 "8417bb4c6615eabb487cb5e89908d9450eb2a014d3cad917e3bd995ea58c2733"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/cagent-linux-amd64"
        sha256 "015d064dc3a2daf8b9e822b2b747463d92b0a2a2500380e6ddd23faea1c73cd1"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/webagent-darwin-arm64"
        sha256 "4d942e20159efb8597e57816e4b09da11a81e9c867d763eefc6b706257c37d41"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/webagent-darwin-amd64"
        sha256 "ff01ee00a25c1a69cea30553b1f05985dd65a28174ba481d7fb5002e49c6fe29"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/webagent-linux-arm64"
        sha256 "561901d6a73e7175b41ce9827c2c6ed101e76962394841633853a0814435852a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.4/webagent-linux-amd64"
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
