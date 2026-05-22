class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.6.tar.gz"
  sha256 "75b3494a64118040fbc62631e362cb464da65e55bc059eb4235d65e58d2dcbc0"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/agent.sh"
    sha256 "4afd04693718dceec46d23ffcc66591f2b3dc6774198ea920a2822ca8240fa19"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/goagent-darwin-arm64"
        sha256 "8fd5a84f27340592cce3eceabea4a081b92616d7976f37a3cc4b78dbbe39803d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/goagent-darwin-amd64"
        sha256 "501f31f73bd47c77a32596bc00c444013fd063dc639976c1ed19a63a3a0afbf2"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/goagent-linux-arm64"
        sha256 "40ad5ad926dc9a0cdb5f02a0016ef07008f864a89102945e4389dd956f2e2880"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/goagent-linux-amd64"
        sha256 "629de5387d14aad80df5eb5a40d39981e287ad856c5e6800b6df0948df60b63a"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/rustagent-darwin-arm64"
        sha256 "c8e001e2337da05a62eb6f1c4a1e8027a4e0ec4c8f4f5a90915636c40b52a286"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/rustagent-darwin-amd64"
        sha256 "eecd1e0a649512d651354d86a450e30e2d3f0c3f9aa7625ccecccc5aa583fc49"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/rustagent-linux-arm64"
        sha256 "85093459c42e905ac5799c8ed4f31b025533cd2f3c8c766ac8eeb92923c6b4c9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/rustagent-linux-amd64"
        sha256 "8b2d4e1176504a2201df51bda8a76a0a84b9de38c34ec83754c2e364ddf8fb18"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.6/tcode"
    sha256 "74aabd0135a1a8e2d0d399e372df8023f257552f84bba7fb3a459ba5f3962ae7"
  end

  def install
    # Install pre-compiled binaries
    resource("agent").stage { bin.install Dir["*"].first => "bash-agent" }
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }
    resource("tcode").stage { bin.install Dir["*"].first => "tcode" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
    assert_predicate bin/"tcode", :executable?
  end
end
