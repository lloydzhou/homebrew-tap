class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.1.tar.gz"
  sha256 "1ac2e3380d43bf0c4ff9b32746b52394ff025a5d47fd44e7f88ca04967c9bed3"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/agent.sh"
    sha256 "85dbbb50a869534367e26a0bba9f42bac940950a2e7ea8aff7f4cfe212cc980b"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-darwin-arm64"
        sha256 "658cddfb9330539ce90522a903ce8e656fe1ce4e4dae39fd74716e7aa184e18a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-darwin-amd64"
        sha256 "6c15812ee632c28e9757798f206c3fb9e4ab6371aa8f0c8cb46c11c168df66d0"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-linux-arm64"
        sha256 "0b88c18c7333ccdf6db87e39de70a7e1f4832f7b84187d3dd08409a644670f61"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/goagent-linux-amd64"
        sha256 "30ac8439b5669cca28078884640d2bc5b11e551b38a7b05a8a28c0263f8a5db2"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-darwin-arm64"
        sha256 "1ecf4b1ca92cf58a1496bd788ea72b336a48f6c133f8d45968358981d9100a2f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-darwin-amd64"
        sha256 "3c46ea85e0dfca8084c888371a33986789f4135ce7860932b9f585863c69a60d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-linux-arm64"
        sha256 "315f68930fdf1b504fe92f9ab67f23449ad5d31dc4f381996bce46b90368ca4c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/rustagent-linux-amd64"
        sha256 "e1d04d43359436e9a14f497cf58d44031a13819e1494a6ab728b15585a98b576"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-darwin-arm64"
        sha256 "2ff9a71ebe3363ea0d3fedbd142101aa7c4c0f3afb3c0621154b1bbbcd1b1fce"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-darwin-amd64"
        sha256 "fb93d7deb11819c175437fe1da7652273b9c4a7c590bd90be356b4a707566dfa"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-linux-arm64"
        sha256 "954aed31c3055e5b52b33c62a79c061825000bcd1edc0229cd9da8682bdd7ba2"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/cagent-linux-amd64"
        sha256 "65ea11dd2054264c2ec00d3ddc5feaa7ae1ccc462021be743a844db2d17d3770"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.1/tcode"
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
