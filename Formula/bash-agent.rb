class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.2.tar.gz"
  sha256 "37dbf91069ab95cd26ce89f386803faff8fd8c7ef0b3eabcb13886a23b948ae4"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/agent.sh"
    sha256 "782fbd17855269cefae40ee14e00c5886cb5306fd48bb232e9005343ff09324b"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-arm64"
        sha256 "4add45a3dd9b09b83a1ec1241739b0490a6596ab3f5e25c9fd3d5a142a1af384"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-amd64"
        sha256 "5f35c65d68230c859e98e63cdf7d653eb5cf7ac5435a9718a504529e5e89fd08"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-arm64"
        sha256 "eba8c58c70e312de2431453338222d4b4ca1f8bbc9e5a671ee3a51238bd0916e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-amd64"
        sha256 "7670c4901463465d9bfd024f06d622cc7213203af78150b15107bf8292d09345"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-arm64"
        sha256 "9abba2e95aeede1bf94bb6f0a4c22455308b51a18da4f20b4eef86db2abc71db"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-amd64"
        sha256 "89050b9bc206563ee9002962a5828990ce361016801c3e8963843f50cce7087e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-arm64"
        sha256 "4a94ce30ea3478d730979879c2ccc9295a2b08e60961d14da9db047b12350513"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-amd64"
        sha256 "d161019fcfa5f1a89ac016344af5231c2d1ec3dafd146532d2bb4a89dfc2117e"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-arm64"
        sha256 "e8ecc11e6d701dc2021c3a660883cb119eb73e47b3c233170eb925c982d6acaf"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-amd64"
        sha256 "8457ec5f7e1affe46f50c24c7599b2f56206e3c2bee5e42c15fe57c07770853d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-arm64"
        sha256 "fd1d3b02f89f2209b72960e4819cb22463a5be8ab9153eeb486384d7b80b6e09"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-amd64"
        sha256 "d9600e5286a57b82bec3e3fc0087bf41be88befce2e7832ce8f4745a3e09921d"
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
