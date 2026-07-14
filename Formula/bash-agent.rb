class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.19.tar.gz"
  sha256 "2d4f4498837c27fa1743472916acfc61443a32b39b3c16b1369867c495dc06e4"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/agent.sh"
    sha256 "62509abdf71dfd7bc3af89bc0ad3978f118260b4ebccbf20a8a8e97baa87ee1c"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/goagent-darwin-arm64"
        sha256 "f6473a2949d23522f996d5c6e0f1603cece4e801b849c70b110a531cefff940b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/goagent-darwin-amd64"
        sha256 "77541628a043938c1d67c6a0bb4bf91beed162e6ba9c950e67b6a3680823c2ae"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/goagent-linux-arm64"
        sha256 "a38ba2221813db9b079379709687f41abac7941b52f6366992cf99189ed8ae75"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/goagent-linux-amd64"
        sha256 "c3d076f991bfc1e8d4109dbdce12a40c7c5a814c1b75d412f00557de7fe090b2"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/rustagent-darwin-arm64"
        sha256 "a881d954b2ec613cc2f59ee1f0468c766d0c59d7c48c3ba4b151a84e98bc5259"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/rustagent-darwin-amd64"
        sha256 "2ef6183252056d12c676ca916448fe75e29ec857f6c2399e7ed08df4321ae39e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/rustagent-linux-arm64"
        sha256 "6431f3d972bd2fefcb0c163e198000ceb1febbda3593c9190a8dd3b3223894fd"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/rustagent-linux-amd64"
        sha256 "aea9181322b7762ab192d7a2bc6ea595144223ba21c2b540567abf2baeb63156"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/cagent-darwin-arm64"
        sha256 "59dc50f9e2279d6c8ee1d44bb6244727b83faec942283a31caa3bd5813b9ebbe"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/cagent-darwin-amd64"
        sha256 "906627ffd2bbc6684dbb24f79e272c82669d9598f8c20d739980591a98e537f1"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/cagent-linux-arm64"
        sha256 "9678fe0dcd4d06d5fe0c30358565eee2a15be6568f385c7aee75769ffd05b4aa"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/cagent-linux-amd64"
        sha256 "c86e448d63599e837217489ae005886ffaedc36ebdfd56b66b8ab5b48c62862e"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.19/tcode"
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
