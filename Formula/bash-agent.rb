class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.6.tar.gz"
  sha256 "4c7f732300153746bca95f765c8a42c0667ca88f98444e63dcf3e22aabe216e1"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/agent.sh"
    sha256 "c05e12998a18fa04da0cb0e168e690650011a2cf3c5edffb2657ec2ee6815dd1"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/goagent-darwin-arm64"
        sha256 "4405b4a781fb73fe40cf41f7355d9d906a27d8f34cb6ab446ade6d37947f5813"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/goagent-darwin-amd64"
        sha256 "1ab9ae7144d918ca91a7fd8c1e6633238cd5bfebd8eb32a1b73ff9a52fb51a8b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/goagent-linux-arm64"
        sha256 "79d9a4fcf98bfa0b7adc602f191d718f8fe0b688130e2c8023660b64ca9e81fd"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/goagent-linux-amd64"
        sha256 "ef4a2ff174aa72c4f0128603770ba0b63b4f5f85ee570f67d88acfbf375f04e0"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/rustagent-darwin-arm64"
        sha256 "b3d37dafa494e8a144b274d6d8199b8b07d57d67e7e0876dc581247cf7639702"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/rustagent-darwin-amd64"
        sha256 "7e244bd4b5c122c15805c6f9db51063472e4cf3ceef43ab2c451949306098873"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/rustagent-linux-arm64"
        sha256 "566c8a9fb61c44e93337db68c379310f878c777fc1bba34cacbdc650fed079ab"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/rustagent-linux-amd64"
        sha256 "3bdc03604862420574a0e2121e3d00d2b918d2d5d11d902508d04ff9e8481aad"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/cagent-darwin-arm64"
        sha256 "cf9e93bb2584162b674058a8218fdd7312e3ccbd0638fc295429ccd741564c91"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/cagent-darwin-amd64"
        sha256 "f8ca28ca979d9c9feaddb3b3ec6781ecf7ac85d860af4b78ae294180f4be504b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/cagent-linux-arm64"
        sha256 "7f2b88c34b8948f9f97275f41d3cfd54e0b4ccc1817441ed30dd462c6460a99c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/cagent-linux-amd64"
        sha256 "40ae5c3fbe4ddac7a2540beaf87206017424e32996b870ef0cd3336ca7f09497"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/webagent-darwin-arm64"
        sha256 "846c70924eba061b345eb0b952ac11e8f904d6ddfdd311d51d969a3f832455af"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/webagent-darwin-amd64"
        sha256 "bc69143d9d45b9dde91309d699855b5e581c440d0038e9f6194fe7ba3ef5eaf8"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/webagent-linux-arm64"
        sha256 "c4f6d28f68b3f30c6c5a95bc85442ba15ec176a5de5722ac3dba88ad986a03dd"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.6/webagent-linux-amd64"
        sha256 "7997f6d8e190399ea896c297899da2b9f22f49d16ef572802063c214f0156c0c"
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
