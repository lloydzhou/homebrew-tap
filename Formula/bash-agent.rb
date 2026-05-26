class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "cb396d49e0019fd24fad22c2ecdb5b2ceb390b260f4b1e570c5ec35751598bf3"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/agent.sh"
    sha256 "5114bb6394c24bc08cd0fce15eb108d96b1f828039e82e0e2d55d98c2ef3239d"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/goagent-darwin-arm64"
        sha256 "4d61c057246e9924f5a5ed6d703957fc27909070120ae2ba7f7b69d8ae4635a2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/goagent-darwin-amd64"
        sha256 "a8183919b83b6412d75a6d6008fd28890e1095b5795404fd90629afaea3f9a64"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/goagent-linux-arm64"
        sha256 "e04990b6fbad2cb6a16161d319e4c5ed8197060dcfeede6171eb95a1c04bda0c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/goagent-linux-amd64"
        sha256 "1310ae527cb980839628ef841bef621ae09e79af87364cd3c6dddca50a6dc50c"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/rustagent-darwin-arm64"
        sha256 "14361205e416df8fa1f3545e863efc593e128ee3ac9b7ce11cee9c5337a8584b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/rustagent-darwin-amd64"
        sha256 "6c2d253c42ef93b88ceadb4a03079b8b872277be94316c4ff78a88f46799dc94"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/rustagent-linux-arm64"
        sha256 "d31b149de4546fc8066200dabdfa32514b2c4b93fa51c8340a08107f2ab83ae3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/rustagent-linux-amd64"
        sha256 "0793dfbec5df730f841f24cc9fb4239c277239b1fe93349e2f8b48222a46fea3"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/cagent-darwin-arm64"
        sha256 "463dccad096ce1b27492fce7a6ed50df6725c564f4004c9e16e33ea32fcc4357"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/cagent-darwin-amd64"
        sha256 "7c95243c9f9b6f3fba6e0a208e5d0e216013b59e2e5d51fcb278f8f252ed570b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/cagent-linux-arm64"
        sha256 "e2ef5f94bbbe43022d56a8ce3034da9da63711e09e84df55fdb1b9afddfd8190"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/cagent-linux-amd64"
        sha256 "754171d0e1eab7d16b842c84b0f305937f10ba2226a5f20ec97254f3f14f0802"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.0/tcode"
    sha256 "74aabd0135a1a8e2d0d399e372df8023f257552f84bba7fb3a459ba5f3962ae7"
  end

  def install
    resource("agent").stage { bin.install Dir["*"].first => "bash-agent" }
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }
    resource("cagent").stage { bin.install Dir["*"].first => "cagent" }
    resource("tcode").stage { bin.install Dir["*"].first => "tcode" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
    assert_predicate bin/"cagent", :executable?
    assert_predicate bin/"tcode", :executable?
  end
end
