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
        sha256 "9104619616ffde9c4040c7808aceb63e37e6215b4a49ec018295d4e98cdf590f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-darwin-amd64"
        sha256 "0096a49e6e03cf18ebb8da07bd91549a9245a00d6916b59fa66a5cc9bd9ced8a"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-linux-arm64"
        sha256 "0339875308dc7079a9870c90e8b482fc687b53af7afd84c26c7cc4f185588a7e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/goagent-linux-amd64"
        sha256 "9a4c248c8e2bdb587b44296b8832275c6e3f7cd22797250b7b13f872ba19d379"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-darwin-arm64"
        sha256 "00317e715ad98be03faeb62c07aeb3cff708ee96fb168e73fa7d783c0b2da12c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-darwin-amd64"
        sha256 "fcfd26773afa09bfbb20ffcf5218d8f130ef32b8fbc4a50fb04bf4b30e2c8c3c"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-linux-arm64"
        sha256 "649136d5937417f33d4b2948152533b8b80807380210fe51e2863d4f7239b212"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.7/rustagent-linux-amd64"
        sha256 "08032683960909c5fb496f5c01acebe9893b93f86f5ddbb3e89b76eb34c6753a"
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
