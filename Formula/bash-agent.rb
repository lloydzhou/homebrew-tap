class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.5.tar.gz"
  sha256 "2dd14ecbe503066dc6f2a5882c2751d8b26fd131302b57896bd1a24143240403"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/agent.sh"
    sha256 "c05e12998a18fa04da0cb0e168e690650011a2cf3c5edffb2657ec2ee6815dd1"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/goagent-darwin-arm64"
        sha256 "1aca70b04df96c539d8af1fe51827aa676af0e8e397733f546399d15e52bb81b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/goagent-darwin-amd64"
        sha256 "90f226a230c199ea68ee09c750b44e78b3ec057797e4f436a6ace011866e4606"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/goagent-linux-arm64"
        sha256 "79d9a4fcf98bfa0b7adc602f191d718f8fe0b688130e2c8023660b64ca9e81fd"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/goagent-linux-amd64"
        sha256 "ef4a2ff174aa72c4f0128603770ba0b63b4f5f85ee570f67d88acfbf375f04e0"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/rustagent-darwin-arm64"
        sha256 "b3d37dafa494e8a144b274d6d8199b8b07d57d67e7e0876dc581247cf7639702"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/rustagent-darwin-amd64"
        sha256 "7e244bd4b5c122c15805c6f9db51063472e4cf3ceef43ab2c451949306098873"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/rustagent-linux-arm64"
        sha256 "566c8a9fb61c44e93337db68c379310f878c777fc1bba34cacbdc650fed079ab"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/rustagent-linux-amd64"
        sha256 "3bdc03604862420574a0e2121e3d00d2b918d2d5d11d902508d04ff9e8481aad"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/cagent-darwin-arm64"
        sha256 "ba4fbc533d16889c6f454c8cacd3e49b954282b7de2470697f94c46fb4a50800"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/cagent-darwin-amd64"
        sha256 "f8ca28ca979d9c9feaddb3b3ec6781ecf7ac85d860af4b78ae294180f4be504b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/cagent-linux-arm64"
        sha256 "7f2b88c34b8948f9f97275f41d3cfd54e0b4ccc1817441ed30dd462c6460a99c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/cagent-linux-amd64"
        sha256 "40ae5c3fbe4ddac7a2540beaf87206017424e32996b870ef0cd3336ca7f09497"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/webagent-darwin-arm64"
        sha256 "5fbec55ab9857845438a7db003a8e4dd5142e9f0cb17f10b8b8f6b612dadb2ce"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/webagent-darwin-amd64"
        sha256 "c436dc68d4cc79695ae3102b7f2adf12285709dbefeb0ac302509ce34c1ecaed"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/webagent-linux-arm64"
        sha256 "3e46386ae7a308fb9ff57841c914b69956a385e105a8bcf59afc747442dc7932"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.5/webagent-linux-amd64"
        sha256 "aac3fdbe1ba2fd7b7a85238cfee436bb6b32d3244573b4d21d4bbcc030d82e09"
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
