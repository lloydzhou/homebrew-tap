class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.6.tar.gz"
  sha256 "67a3ce26cb8e850994d875a04091068d5ef1c09a69848ee63a5f51c637d9c64c"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/agent.sh"
    sha256 "94a2912d918c2dd906ad61c200d5eaa336f0b069f90db8f28b7a1c8c345f66aa"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/goagent-darwin-arm64"
        sha256 "bc8e392a8bf74dd824fb36f621ec7aca79cdb8d5dc32ba5ba67bddf9b5fefb9e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/goagent-darwin-amd64"
        sha256 "d848920ed484970c538381430c72c53d8207fb43ece37189da21848a37ebeaf2"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/goagent-linux-arm64"
        sha256 "ee8a28b21e1f3a3b6ef4a7f3f7af030e4fbfe9cccf9ccd2ea4c1d4216ec59054"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/goagent-linux-amd64"
        sha256 "72e428186c8818d0ad69db58f81949bcd5da1f4f4baddc603a1657d00cd31881"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/rustagent-darwin-arm64"
        sha256 "13149c006cdfc758d845c999006b4d56e97871c4daf7a2146d2c79b7f8c10376"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/rustagent-darwin-amd64"
        sha256 "1dacfadc0836b683b6ef50a7ad262eb30500298daa7adfdb264224cb9c4da2c6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/rustagent-linux-arm64"
        sha256 "6fe89850305731525ec64d494163b60b1614ed4b8b6dbf923276a12faee120aa"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/rustagent-linux-amd64"
        sha256 "8ae60cbed4fe3577c290b745cb55cec0007f3f774011b9689a2160960dbe5692"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/cagent-darwin-arm64"
        sha256 "6747302a8e9fa27c134b0dc38d25fb807db059cb684c2bf509f3c027bdebafbb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/cagent-darwin-amd64"
        sha256 "696ed2101135a32478eb9914d7b263d612d0e4f36bf7add0c51dd9df4b28df2e"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/cagent-linux-arm64"
        sha256 "4d34a261658cc032919b021f64cf804cde674f228cc263d252bb9fb3d24b9ddb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/cagent-linux-amd64"
        sha256 "2bd1b3a79bf551a8e46a7514c829289ac605489622d6e4a9df5a72bd90270bb7"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.6/tcode"
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
