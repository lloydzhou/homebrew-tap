class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.10.tar.gz"
  sha256 "addf0d8d8ca84e7a56a99207a69ef1c0b03d0edf9abb7e487f7fa6c00cce5997"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/agent.sh"
    sha256 "fa022c5e3f3a8d0c541d1d94fc6e468e8a263078bc9d43cb02349dbb75ea555c"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/goagent-darwin-arm64"
        sha256 "ddedeac0dd17c4203f94a089f31e1f72470933d822c310d205e493c0fca25e12"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/goagent-darwin-amd64"
        sha256 "5637dd56dcea81e5118a7dbccf0bbd7dd8fd353a25626e1711fe1919a753a18e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/goagent-linux-arm64"
        sha256 "3c1ca659c9430749bc9747341072422ce78f5fac4edb60f4fbb1fd3d944e48ff"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/goagent-linux-amd64"
        sha256 "d0660fb1593e7790dcc467ee23dd5a8d29cddc2d95a72d3faae942f6bb1b9a5b"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/rustagent-darwin-arm64"
        sha256 "58f556297d3a1ee38ea5d795d7e95fbb10d970457a06a7980cb01e247d87a990"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/rustagent-darwin-amd64"
        sha256 "c3f26635f3fb980d96920c15d36e3b6ac798547742dc26fa1cff8e25049bafdd"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/rustagent-linux-arm64"
        sha256 "343af63c08c8bd030da652d225c5338a338426e101c9e6009b055f9e7f1db195"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/rustagent-linux-amd64"
        sha256 "462b2ce470350c9cbb1179ffc09b7988879f2f7a7dc5f1803a54200f07bd65de"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/cagent-darwin-arm64"
        sha256 "fe9b4f3135b217a5fb5777622639a564795cd8f5cf231ee46050375eac1dc856"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/cagent-darwin-amd64"
        sha256 "825432af4d3429f59ad51c939117a185553dcba7ae3cd62e1411ab81914d49fa"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/cagent-linux-arm64"
        sha256 "f63c6c63a21fe369aba5c59b726241e2388fb86b22b6a8746b3a60d01f97187e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/cagent-linux-amd64"
        sha256 "ea360f085d0613ff1e5b95efd34a4e61f4464d2a8ae94c7cff46c51874483464"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.10/tcode"
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
