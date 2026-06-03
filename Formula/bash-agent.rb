class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.7.tar.gz"
  sha256 "e84151dc7ec29f9d7420b27d694d647830f178b79ab5b04954efbd614e5cef4b"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/agent.sh"
    sha256 "bf93383b684a9dccd8e35427081def8b6647bdc302ce760667f7f3b10692ac6f"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/goagent-darwin-arm64"
        sha256 "a0fd7585ba0a838c00a3a4254aa6cf3772921bb799b2e77d9e344c3062d9b7cf"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/goagent-darwin-amd64"
        sha256 "9cf77cb46a49289e9b17fdd9d5517f31dd82e1abf46a7e1535d174149be8f88e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/goagent-linux-arm64"
        sha256 "321bfd0156a6392b747cd5e506038f12bd2a118f6530eeb907092b9bbf108007"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/goagent-linux-amd64"
        sha256 "8d2cc1f0e59b443c642ce10f4c6201f956d6e6d1de71bf184483f32a62ac86d0"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/rustagent-darwin-arm64"
        sha256 "4597cb6765e9737f2cecb73d0feeb97f790b697974628a0901e133be02457c48"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/rustagent-darwin-amd64"
        sha256 "53cae032f24d5da33ff83040bf7f5d1269d6cb16b65dab13e8beab2293c977ef"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/rustagent-linux-arm64"
        sha256 "02437586de81b569d1e9ceeaa4bd16b85d82f075d1b2065f6a6fa7f8b6fe251a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/rustagent-linux-amd64"
        sha256 "a22f4af5a211eb06b91021b4da43479b331cd9d0fbec8a786e0ebc4d6248322c"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/cagent-darwin-arm64"
        sha256 "08e9203ba84475877212dc9d2f0962107e978cb2a0477c8ad4523348103e7235"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/cagent-darwin-amd64"
        sha256 "ceed10ccce2cde89b30b1cff615d6f0bc77af11170c2272a11eb6c43e8a31889"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/cagent-linux-arm64"
        sha256 "35560673c698b8c113cb2afd3074728cae7b2024770aaa51e4334db6bb108424"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/cagent-linux-amd64"
        sha256 "425aabeebd892f65f0cc57bb3680bbde76148f8b4571b0e36b45264560aceb53"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.7/tcode"
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
