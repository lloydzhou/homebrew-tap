class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.7.tar.gz"
  sha256 "c1480853c57d61ac9033062cf85e07355298a8420e71b19dc6890ee95f395e77"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/agent.sh"
    sha256 "d7760ee33ae70e6dc311df3fb366e33c1e45ab13c112e0560b8819eeebc53d4f"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/goagent-darwin-arm64"
        sha256 "f5772dea566c8e67f3cfd70fb4358044e10d8105dd43cd8f6bcd0402a1929c52"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/goagent-darwin-amd64"
        sha256 "7e4ac1dacbf3ec00c70fd34283cb5d463f1042b0c0f8f09a79f627fd44ffd61d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/goagent-linux-arm64"
        sha256 "ff73b6d6dbadfdb408eda705cdcea32d8575cd258788066c02f69b53b856b1b6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/goagent-linux-amd64"
        sha256 "05aaf07a4a3fe9b1aaaa41546b1e902df9695b914db6a4c97cf7d6b95a51d71b"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/rustagent-darwin-arm64"
        sha256 "a3b8de12edbe847ea666d00899ad4b9034301c3a9e5fc41d3da8e0f223e2bc72"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/rustagent-darwin-amd64"
        sha256 "d5323d18ae936d09d79f0435674d8159fe9aee62a791353cdea13f002985f461"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/rustagent-linux-arm64"
        sha256 "9f2ec5ea451ce3d320c5331318b55195ef7c6b8a71f710d72692acf74d4d7edb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/rustagent-linux-amd64"
        sha256 "f3c4046f4a303646ae7a7fe5a9029b2e84f41a1b647e1af93513b65df48e40a9"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/cagent-darwin-arm64"
        sha256 "0bee6f6991366f26311bcba26bab3b724cb6ca8ce9035969f3868e1ae0e36744"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/cagent-darwin-amd64"
        sha256 "83e6b2a4f3389d10232d6e6808fe1238a4eb075b3274205cec2869e83dfc3dd5"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/cagent-linux-arm64"
        sha256 "d98dc86fb5bcc49ace2dd1020b2d06fb0c2beb4ee7625dd40c71795e0fda1dae"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/cagent-linux-amd64"
        sha256 "2b31cf0f4363c90a0d9a0799ed000fe7053a025925579672a257fa7399076ea0"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.7/tcode"
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
