class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.3.tar.gz"
  sha256 "631ca0ba21913adfd1b9124ff5bd3f03ebe277dea1bf63477dbd78a3fa475ecb"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/agent.sh"
    sha256 "0ebdebc72424d4891066051aab17e081c716d9f5ea6a0ae330da454863ab00ef"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/goagent-darwin-arm64"
        sha256 "051f63e5c26a5e40b31f96917d061541c81d6750a9890976402e21512b5462f0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/goagent-darwin-amd64"
        sha256 "1748753f168a7ba92dcaab26bd876f65cb512088f46323914e6f309a9a0b86f7"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/goagent-linux-arm64"
        sha256 "0f0c0a351e8d7d770a7e18a69cc9b4a66007c1b1e2d5dae68ad658a2bace79a2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/goagent-linux-amd64"
        sha256 "f336339a4742875d90fe008240c1f3a639099770eb082984793ef3d530450390"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/rustagent-darwin-arm64"
        sha256 "5560015b849742ba1e5b161eee200b5c4f9909aee989a0a5404fe133b315e0e7"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/rustagent-darwin-amd64"
        sha256 "ee0fa078d7d17bc1ca889d2e81e69dd012617a150c31a1e321c893e5a661ab04"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/rustagent-linux-arm64"
        sha256 "9be26c599c0af58b8493e4ea7ac9683d85dc6bea0f1608a110641306a2fe0ffc"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/rustagent-linux-amd64"
        sha256 "31f54c4bd2653b9fb37f241d5db3a3bf9197ce42234e33d27f8f0570db23b891"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/cagent-darwin-arm64"
        sha256 "d8c497e1d2ee2735d7cd8a8ab315753bc221109915c5fffd205635de6bd60ac3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/cagent-darwin-amd64"
        sha256 "7814a7047b7b79063d9d3a30d3ae01f26baf915b4486b0779290c467203477f8"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/cagent-linux-arm64"
        sha256 "ab664e1af7d6cd2deacf0b4d24b711c3f48ec2e204f5432cd8ec70241dcd8348"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/cagent-linux-amd64"
        sha256 "28a9126c21fa83ec35240f4e385b01e4e44e05ada7612191949d5a89677a1e09"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.3/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
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
