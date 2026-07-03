class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.13.tar.gz"
  sha256 "772d22a5756ac82e502d6bb9cbd7fa754a3e3dba431e6291f63184606c40dc93"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/agent.sh"
    sha256 "8f848ba0a1e0baf746c14145a1e855c9ecf76f9340ee4fcdd7c4513ada0ebecf"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/goagent-darwin-arm64"
        sha256 "f2c5835227019499ef315a6dc4fe3d21d5f5261a06aad46844bd837eaabbe9a5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/goagent-darwin-amd64"
        sha256 "1ad40b4f9c98121ffaa068c30f9e2e3ebe1becbd855742b061c564b9f5c3d1ff"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/goagent-linux-arm64"
        sha256 "de2f3411b4c84be78b1573742648be44fbf6f61299c84d83a4a1e4a842dcb64f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/goagent-linux-amd64"
        sha256 "414924515f39346e2c7b914a753966e0de4d8b7ccd1631e4fcbfe02205782f0d"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/rustagent-darwin-arm64"
        sha256 "7037381cae7515fe1fc64f49a744967bebebfe8fa3ed98d8728e10072f8686f3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/rustagent-darwin-amd64"
        sha256 "5b127a4a0b3756a100693073534ada7d706b6e92133b34054d92927c4a753da9"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/rustagent-linux-arm64"
        sha256 "92a2ea1077fe8d22ad09dd8f4fda24ccb9c730a02a1d06c99e28f5bb5f01187c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/rustagent-linux-amd64"
        sha256 "84d80ffd535f5c2259480df7f3a8ad355c98ba763ff333015f6d54bb8fc5436e"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/cagent-darwin-arm64"
        sha256 "6b792f993462893e6ac16371324d19c68f1bc6c4361a7c2cdd621383f72eaa08"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/cagent-darwin-amd64"
        sha256 "5e4ba299f52603a62143c191a1bdab32a9296d4597ae60d0d65cc3f282e3e3c8"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/cagent-linux-arm64"
        sha256 "91acecc75e5e8d8125301a864c7f8644a49a32fad0cfa62950169838b9f3a64e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/cagent-linux-amd64"
        sha256 "5932adafb3c47d868303af6080f5c781c471cf84289281f5d2e1b5b427e95b48"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.13/tcode"
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
