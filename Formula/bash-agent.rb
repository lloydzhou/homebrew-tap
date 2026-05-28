class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.3.tar.gz"
  sha256 "16d31a2e6ef9a6d5995f484a8b0f68304307e13c4b5e05b3e46d297154261cbb"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/agent.sh"
    sha256 "64d0961d242bdf13da3bac026b8442e8df8a2933e09ff65f8b93bb815c78f74a"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/goagent-darwin-arm64"
        sha256 "8951e286c1c379e3e50f3140faecc55a2b31458eee9b166f53a508064da4a471"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/goagent-darwin-amd64"
        sha256 "a902220174908e0c5ea98e5529a51408cced9381ba71afe1b16346b2a0fb3cfb"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/goagent-linux-arm64"
        sha256 "f61aecea10336c2b348df02ab668eab5730e7056277742bab0eb39c5a5d2a342"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/goagent-linux-amd64"
        sha256 "96a49131804d7aeca8408275749690f6d3140857be2b20edb961e51f4a65401f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/rustagent-darwin-arm64"
        sha256 "21db6f9ee5c4d80b4b0162911cf138bfbe9152a78360fd5b806782a1dfa79341"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/rustagent-darwin-amd64"
        sha256 "97341339b69c78e3e41fcecbb705c90208836db045cb9edbc77c8310459e87dd"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/rustagent-linux-arm64"
        sha256 "719636cad5b8f5a41301c35876b59fd22c5f3d42595a44828882df027834c263"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/rustagent-linux-amd64"
        sha256 "f65e101fc2c85d4b3555909c8f541115acc3f63dc2742a27cbb755e0f81768f4"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/cagent-darwin-arm64"
        sha256 "67c4b066a31c008f585aa5c5a1ac56b0cae1df89733909b574e9bd6b692b778f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/cagent-darwin-amd64"
        sha256 "ef09d7633a172bdba821ff054025da67b80f190b0a1528a1d6ddb64a54349e10"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/cagent-linux-arm64"
        sha256 "a80743130835d3a3262a7f4d326cba3fbb12c8e758585b9714acf7db3be5df04"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/cagent-linux-amd64"
        sha256 "daaa22ff2f098a5b558313f169900b08f533f909204b627138054cbf55dacaf9"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.3/tcode"
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
