class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.2.tar.gz"
  sha256 "1633d3131a01b02aaeacdb44f22dedadb1fa2cb7e25054ceb7734bb361b85d75"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/agent.sh"
    sha256 "ebe1433c18c75f667c30974b744d7b689aeb75d300ec76bfdf87a1f4681e9f2f"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-arm64"
        sha256 "5c0504fa82cfee88bb3aca36bc0d15a391c520d5ef50dbf82df0ac77b8382a14"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-amd64"
        sha256 "de0b9eb0264e4b799d627c0920864c62a7c550bdcbd1b41af567d3867746d624"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-arm64"
        sha256 "f8f95c79d6080ced1746ef42f7cbc57dc686adc67a7f41c36b26e1f5bf87a8c9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-amd64"
        sha256 "6b253046e216126965847fddac00a7fec8e7dc553d2e0c35c1f0893a47b177f4"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-arm64"
        sha256 "8f3992d4c6489522a81519512cb2c0a769d6fa38a4842a232a1ba3ffb94b49bb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-amd64"
        sha256 "91b9e5535b81c40b27fb04a1494b51568dcb40a3bcf603b94e27bf6c93c49e99"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-arm64"
        sha256 "d2697e9ca38f75ea624e074861cfe043f16a0aac23e85595c906e2d3d9db7aa2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-amd64"
        sha256 "ceeb8f912b6e56bfd56a2697cccef26458b06774397a98484316b69d4193b333"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-arm64"
        sha256 "6c6bad398814040a8b2aef8661d36640845613245b58dc4321cf0dc90498fced"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-amd64"
        sha256 "bfec65eeec8208072ebaa68568cc71a09c15ac826704cbbc69c9176062da032a"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-arm64"
        sha256 "ceca3e0fe1cacf7e79a83c55da7106a09d055c5f7d0c5a566e190a1f34ea5867"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-amd64"
        sha256 "3c638b7a77ef1d53bd72cbd0893ef1e535778c06730a2360c4720d364f3346d0"
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
