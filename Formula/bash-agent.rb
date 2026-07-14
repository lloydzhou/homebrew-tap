class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.20.tar.gz"
  sha256 "a02a27d55332ef1fd6d208fc5e06125031462f0c5c7b4fcecd7cf7a733057ed5"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/agent.sh"
    sha256 "a7dff1a3198800e2574409e8a38e21898087e3555b2965a13a51ee4722ed2211"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/goagent-darwin-arm64"
        sha256 "8817dd4dc43d69891a084a40be537057f21edb925a9a21a8d467ce2067320565"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/goagent-darwin-amd64"
        sha256 "8ff8aeaa3e111e9dce5b9ad4227b12e3712e29f9c889c2159caae2bd2dbd5bd6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/goagent-linux-arm64"
        sha256 "28465a6ed7cad3ede5d26b5d3019e592d38311e611fcaf57b4ee25c1c8591da1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/goagent-linux-amd64"
        sha256 "3229a5a96d30bc76c8259be67ad0a9f13930ffda6d301344793baa482fc79aa4"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/rustagent-darwin-arm64"
        sha256 "8bec2b7e51052b680c0611022a9219b8fcc062e5d0d33fd538030606a421befb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/rustagent-darwin-amd64"
        sha256 "f988ea9a5f1e24a535399e102b90324ef42cfdfe7d009cb6d836c0131d7ed04d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/rustagent-linux-arm64"
        sha256 "35a6fd926ae68269b716e54dbabea0ab56034d8de3bb85048126b29b6cb66604"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/rustagent-linux-amd64"
        sha256 "1f46d4e36e8eea4c628108358149f5504086b9022eb36d51d398c5ca959c6eee"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/cagent-darwin-arm64"
        sha256 "b31ea06fe02f5a7064a0b046e77b4d0f7f08b3e638487940c79a40957c1fcc69"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/cagent-darwin-amd64"
        sha256 "cb6819f1e21f8df8ef8c6b5da96f289da9a82702db73d40768f73a3cb8345d8a"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/cagent-linux-arm64"
        sha256 "3e8406b4a2a37d7c09df5085f9eee955c7abb26c8446c2bd4e9da6c22e09c4bb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/cagent-linux-amd64"
        sha256 "604b7cc7e0ebae1d8865b87413a8c0274794ce38ecc573e7fb4d833329ae482c"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.20/tcode"
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
