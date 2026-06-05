class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.1.tar.gz"
  sha256 "6db83d22682590aa29c0b155585b2a8bf633f532ed648f43e98bd15091f72811"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/agent.sh"
    sha256 "f032aae26eb2b2a0b10c144a2f8abfcf5a17eea378d21512f4d88280dce93907"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/goagent-darwin-arm64"
        sha256 "68568f7c8a04712e1aa6e19f8794fe931c5ccfb8957184b028da2a1c52be61f7"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/goagent-darwin-amd64"
        sha256 "07b80670533a74a269d2975c3826547dfcbb9001f3045925b3cfff394cf112ca"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/goagent-linux-arm64"
        sha256 "8ffd52a3897d0ea2569d9a96f0192c33824f3614a169e4dcd46dc6b7c42d9031"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/goagent-linux-amd64"
        sha256 "ffc597f0e664df1e67ad813830dacfe7438a44bf7f494931127df90334fb5adc"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/rustagent-darwin-arm64"
        sha256 "f5c08a99c6ab25401d1d63a1d8974c68215535afa620fa06e71bfb16821dfd4d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/rustagent-darwin-amd64"
        sha256 "f1a713fc678f9b90fec4062976ea7f8860b8430742d73fc2fb932a27a6412402"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/rustagent-linux-arm64"
        sha256 "bcd8cbce198c7be9adb4c2c985bcc47bee52b1b19044af65ba85df622690e875"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/rustagent-linux-amd64"
        sha256 "008e3200cea3244694d0096ec0822631ea0a2cc3a620a2f1575102f7411fc499"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/cagent-darwin-arm64"
        sha256 "57555b0d15b564e1cf09ef0b1e5b0386de6f0c85914d795149e233ecd710a412"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/cagent-darwin-amd64"
        sha256 "1f823391230b8f26bf7ee40addbfc655e103ba8b4421af6844ce35443688e2c8"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/cagent-linux-arm64"
        sha256 "21d4165e0ce4074b9a4573680e4a1ef74140f992541ffb5bb91d54430f0f761e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/cagent-linux-amd64"
        sha256 "88d73731cff8d27cc15de075ae7e95cbfdfefcd0ffe2debc32fe7fa447de8a53"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.1/tcode"
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
