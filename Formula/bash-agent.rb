class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "8916b86cda1ecc06bb0079801efd74f36a17f2d0d8260b858ce462dec319a203"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/agent.sh"
    sha256 "c4d1e46b400400faaaf5a0621ef7e66f2735e8c558d19f96a6f9fb4a2279b944"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/goagent-darwin-arm64"
        sha256 "90b9e56811ca44192ea2e7cb21d10417a0676a3dfd804f92c0a322278f870bee"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/goagent-darwin-amd64"
        sha256 "2798f7bbb09e70b8eb6fccada80249647f50b77f7b2ac02f8cf3c2930baee2e8"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/goagent-linux-arm64"
        sha256 "012a8640592c42541aaacc41135e1210515a7c71b3d4f8bc69ceede1be9a7cfb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/goagent-linux-amd64"
        sha256 "9655a157e9c99f11834f38630bb900353fa0c7b8669734cc06e1e8ac31da27f3"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/rustagent-darwin-arm64"
        sha256 "766d8e5968af6cd608cec3b1c7a01cc5f0e5bb5fe828a523472becf439176cfc"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/rustagent-darwin-amd64"
        sha256 "209104cd0427e8182b9382c1d23bb3e4c91ba0dc14563c810866924e12be93f6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/rustagent-linux-arm64"
        sha256 "c518e39e63880336f1047e01d90242ea286a0289ad3b81064bcab31f1509b471"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/rustagent-linux-amd64"
        sha256 "a03722110c4c3ac2d8c0ce505fb11253db84ce3fba1694fe02a6a8d2cee6d984"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/cagent-darwin-arm64"
        sha256 "0c80526b8b705c71700a97c47007bb85a183b69074bd6e5ef00a985021178aec"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/cagent-darwin-amd64"
        sha256 "aa027bfb0a5e968bed0578e212a9c7bc05a59bce36d7d6e09a1f7697f99d780d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/cagent-linux-arm64"
        sha256 "c151e56f91ad9014fd4ae1651f577f6e7c47294106ebaa98deb66620b0b2b88b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/cagent-linux-amd64"
        sha256 "c8f1e564cf7fa70ad59681a5ed541b9b4ae4e1eb698c9753d8d7d7c51b0c684f"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.0/tcode"
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
