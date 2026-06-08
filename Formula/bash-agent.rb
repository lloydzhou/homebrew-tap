class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.3.tar.gz"
  sha256 "a0a8ec0551562f267a040c9983626367b0b7dfa70a9ddf2badc77b4e32168d4e"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/agent.sh"
    sha256 "900962333483f078af9a9c11d334e74a2204f0d2ec6100b6383d2c3a22e423d7"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/goagent-darwin-arm64"
        sha256 "3a4bd224ecfadbf88dade1e179448eba42fd484382f09e52074b90e66002ca88"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/goagent-darwin-amd64"
        sha256 "49bdeb2316bdcfe083d6dd2fd179f0ddc0e9538f258304245621acd1d63a7951"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/goagent-linux-arm64"
        sha256 "3ba9a256ca9ccb79d88faf6fb6541baba45e003ab86e3feec2747be11e442bb6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/goagent-linux-amd64"
        sha256 "4a26f3d03f9ef4fa0a0250be1e6ff7f10113d3783c3677770404b90a4cf63d8e"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/rustagent-darwin-arm64"
        sha256 "135a1de08da8ea4093bc92030114b44e4940a9cff87a56778071f917a9242c66"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/rustagent-darwin-amd64"
        sha256 "9937abe17df18f8f69d2a0e99f9add00cb826d36087814b05c1de14b8fdd07f3"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/rustagent-linux-arm64"
        sha256 "7d92e2072256c63a15434c723ff039052507ae68703f832d02d9145893f1fa84"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/rustagent-linux-amd64"
        sha256 "ad94ce3b9ff69ce89841033c520122b81b8e12f725fb87f6f65d9c87be3747ad"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/cagent-darwin-arm64"
        sha256 "178dfaff4ce0dc681cac513ca73d534090c1c12ebb0eaef47cffe28af7274a73"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/cagent-darwin-amd64"
        sha256 "49b6ac09f338cbd0cab73528888ccb7ba690d00190ca5726191b107770a9e2f3"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/cagent-linux-arm64"
        sha256 "86e636b15f589c92bb815946618a2d366ff365d76f08c8f3cba483b230277be5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/cagent-linux-amd64"
        sha256 "fc597c3e7a10a188148a404166b8f5217193c2b72181bfae40ccc73efd2f7e2d"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.3/tcode"
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
