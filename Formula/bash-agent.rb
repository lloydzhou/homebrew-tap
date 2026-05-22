class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/agent.sh"
    sha256 "77bf49e14cf263915e534ed50f5714a7a913152e164a6342c57f3cd4ad532295"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/goagent-darwin-arm64"
        sha256 "87916bf045e710feb6b166f9cca94de49bd8e158fc8863bbcc37cf7f7fc74c6d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/goagent-darwin-amd64"
        sha256 "def98fab98f666b4620ceaaa48c94d6fb759a5922800e16153e93bc6207b9036"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/goagent-linux-arm64"
        sha256 "647d74ac8eae47d042c28d294535909621fc6ef087daf06bfbcc9f5d719bea2c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/goagent-linux-amd64"
        sha256 "0828c08ad38305a7949f47283d6de85a9b68899319be87104960ad5c0cb4281e"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/rustagent-darwin-arm64"
        sha256 "ec24f944245476f4b914222048679a362ee8d319a08ede0fb47aaf27149e1f27"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/rustagent-darwin-amd64"
        sha256 "7c2f7424b674ac6930ad20a4d8cee4acaafd0eb17c1a7eb6ae72b6307b6d54bf"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/rustagent-linux-arm64"
        sha256 "8f5e1810dbf6a01a63d3edfd1478c5322beb560ee9f4d375436ba818c26a49d5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/rustagent-linux-amd64"
        sha256 "1e1fb1723dc3c6b59281c629dba057a378aa10f9d4d8d233a5cd3a98ac3f8d6a"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.5/tcode"
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
