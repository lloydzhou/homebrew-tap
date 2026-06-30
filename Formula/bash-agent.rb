class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.11.tar.gz"
  sha256 "d76b1b57a346a66d302a52fd5af2a0e0591a11e853e119b33085cf985fa23976"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/agent.sh"
    sha256 "cfdb1688f06c337271ba3af217e90ebdb571f90d9495863fe2ee3d9bb49ccd70"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/goagent-darwin-arm64"
        sha256 "f4c9508671c69bfd0e646041a3e1dfe506ce587120ac81d9d2154dec668e1dca"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/goagent-darwin-amd64"
        sha256 "e4c7e80db44e43e2642ca573e2a279dd6d914165ed8172dbebb209fce8800cfa"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/goagent-linux-arm64"
        sha256 "0eaf201fe76c8b48801da290f74adbf41a28d22a9b7ff2beff1e5e3b857a67c3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/goagent-linux-amd64"
        sha256 "832f86a3c1a97f5c443e59db941c92377a02abba6e1a206e2e61c1fed77230b2"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/rustagent-darwin-arm64"
        sha256 "7b313e6e49661fba5c4e73f05dcc9a9ef7f837b8cd4d8fa9085c0c012fc6f222"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/rustagent-darwin-amd64"
        sha256 "549f9c3f29a3fa7e7ef686bcafb10a1ea0331680165e03c1050ab4b81a97512d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/rustagent-linux-arm64"
        sha256 "e0b76214c8bdf50adc2e68b0633400cf046973cd248b553fac743cbdd3f7347e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/rustagent-linux-amd64"
        sha256 "b71f336c26d93fa87fb67387ba3a4376418dcd3a7f717ebe5dfadced44c08982"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/cagent-darwin-arm64"
        sha256 "2899efb346e48342f491aa378de88ab55b4feb8c6317d97e6e254b3e94abf370"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/cagent-darwin-amd64"
        sha256 "b0c3e902853f6d3993c20942b215a39da9d421ba338e597a5c5cb2de59904361"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/cagent-linux-arm64"
        sha256 "0e2497f7ab189309ea70c800add558a48d0b0b3d8c8537b53433e173c6f9d334"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/cagent-linux-amd64"
        sha256 "4deedc8078a4977fbb7ca94acaaf7d60e203a149e408400c4e0318ac1c91fa3d"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.11/tcode"
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
