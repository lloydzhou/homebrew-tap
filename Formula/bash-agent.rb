class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.5.tar.gz"
  sha256 "2d127bf128c4e8055fc68a47dbcfd280cf7c27f1d0267fb84c313ea4d4efb573"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/agent.sh"
    sha256 "6c792766a34c46df910edc3fc9cad448fe1dac606edb097bf4c7350f77aa6c12"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/goagent-darwin-arm64"
        sha256 "1bb7130bcb82038070b38d0153d9326daf81e6e3ec0ca57ae40e0cc7e8dfa923"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/goagent-darwin-amd64"
        sha256 "ee68f1e0541f8900cb055345e5b169d7a6b857a9f47952858d877f8f63d2ed66"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/goagent-linux-arm64"
        sha256 "4890b5a7b7c5f1af18ce69e101b33caf1e756b36d309d7a88882b1ee7a625f9d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/goagent-linux-amd64"
        sha256 "b5c5ecd9b1670e6cc934ca123007f5210f39ba932a0a8d43a514b60378daafc9"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/rustagent-darwin-arm64"
        sha256 "e1def5e3beec338119d67a4f1591ef1b974a661a50ccd2f7b7aa55e692a02cbb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/rustagent-darwin-amd64"
        sha256 "bf6f2801057decbf10ca94c0b69d24de84aa9dd2412c41ca4febc1b2f5b5a7f9"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/rustagent-linux-arm64"
        sha256 "d4f64e538489e874056fa1b7e090bfa580fb9fab29a3055ed0674f324a1979e1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/rustagent-linux-amd64"
        sha256 "ac849e52d0efda39e3f8ad2fef97002326cf635df22076ca6ca6027e451296c0"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/cagent-darwin-arm64"
        sha256 "76eec76414c7530212bd950d0cb26b03172de44fa32cba509bb4b85030a38f98"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/cagent-darwin-amd64"
        sha256 "dc98854afc76d4586b832b2963ba7289b3f0b98b117255e08f05dce7d5bf510d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/cagent-linux-arm64"
        sha256 "790756ede9e48b76cc7881366a62f594ca1419b9ee8cc596f9de027af6dea83d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/cagent-linux-amd64"
        sha256 "0236efa82900af8ef4e4f84b95c610b68704f94766c1438a658026e700d4612b"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.5/tcode"
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
