class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.16.tar.gz"
  sha256 "6c4c11669e3dc3d6355affc6fb11c1fe6f6ef375d0d957363101782285f784a7"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/agent.sh"
    sha256 "b4d82cfd6c9f18978bc75c5668f345db18c7d9a9a4030bbaeb705d280ef4308e"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/goagent-darwin-arm64"
        sha256 "18628dd07fe1ad92b3d446782b245546cb3e685e7b4f8beae60c94f026d904f0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/goagent-darwin-amd64"
        sha256 "45b508c028af249dc21f38a6b73fa93767bab3453dd6c74c1901a944bf7b744b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/goagent-linux-arm64"
        sha256 "350f23832ba148a6bdf2fba4f21dced671b6d920e201ac19eb5b82b0ac56b0c2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/goagent-linux-amd64"
        sha256 "08de951fed43de06d780e7ee597b546833cb53246f43dd470f1eda493faa579f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/rustagent-darwin-arm64"
        sha256 "9cd27e9ef349b9b5a02af8066886786314198994ade8e3bf23a1a8da13e74d64"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/rustagent-darwin-amd64"
        sha256 "c6a09ebcce2a765da6135860620da02263f99029031fbb333f5536c5f01d7c7d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/rustagent-linux-arm64"
        sha256 "26bd11df5a1b7c985aa1c28680814e6e41cceddf94332a9237d215b1f2f02c03"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/rustagent-linux-amd64"
        sha256 "c3c7abd34f232e987a3dc8a5c1e86e26cdf91b860353721eec2609ad94a3439c"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/cagent-darwin-arm64"
        sha256 "1651e67bfcc53ae003e17c5dd53a30a89006a08a650c293e66ae5bbea2267bc1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/cagent-darwin-amd64"
        sha256 "d8247fd09533afa32d4f3e15dba9c738264cacf7bf0148f03d7cc25736f8db34"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/cagent-linux-arm64"
        sha256 "61feb487a1659d9033447855da5b926404921b3a5db9315b30405fe08a9f135e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/cagent-linux-amd64"
        sha256 "5a116bcab1243692aecb65a865d010baecfec39652b444ea131f780f2f1398b0"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.16/tcode"
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
