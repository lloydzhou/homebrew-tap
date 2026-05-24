class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.7.tar.gz"
  sha256 "81cb21084fc9e3ce5d5a32ce4537892dbb71f831839bc4c2ed0fc9866f3fd553"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/agent.sh"
    sha256 "5114bb6394c24bc08cd0fce15eb108d96b1f828039e82e0e2d55d98c2ef3239d"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-darwin-arm64"
        sha256 "0dd126123aa14eaee1241045f5c216acefd41f703bd3428c4b0a30c90bee7346"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-darwin-amd64"
        sha256 "cce8e005f03cd87ec392ddf10db5891b02a4e81799b2873544ea8a782240dda6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-linux-arm64"
        sha256 "84c04658d8d199ba9598ae82f79349242467d2d02728bbec7bf581f7049f4fb8"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-linux-amd64"
        sha256 "f3ba59c7922d520e0b4fa61f9d6c61ac64b7b37cebdebd913d07c93983aa43c3"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-darwin-arm64"
        sha256 "a223f3e2cb81cdd242ff9b5b3456faf04b97552fe207a71329f864b00f08a0ed"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-darwin-amd64"
        sha256 "9a0467e54d6ee2717f6a4d79906a63fec932a587a7c67050c198373ba62a812b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-linux-arm64"
        sha256 "aa92b74ef47b0dcffd4db03f6d79b2d041e8b473f0fa396a6388fc7ddf14629c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-linux-amd64"
        sha256 "2d209ed9cd24d853d02dd3d6f4aad7bf7ae640ddf2d3a4f90bea9c12362639d1"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/tcode"
    sha256 "74aabd0135a1a8e2d0d399e372df8023f257552f84bba7fb3a459ba5f3962ae7"
  end

  def install
    # Install pre-compiled binaries
    resource("agent").stage { bin.install Dir["*"].first => "bash-agent" }
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }
    resource("tcode").stage { bin.install Dir["*"].first => "tcode" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
    assert_predicate bin/"tcode", :executable?
  end
end
