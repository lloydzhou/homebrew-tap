class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.2.tar.gz"
  sha256 "a9bc205e2419e0b684e594632849c0d12132e2be4076cb6aa7b3f18a372e6607"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/agent.sh"
    sha256 "f032aae26eb2b2a0b10c144a2f8abfcf5a17eea378d21512f4d88280dce93907"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-arm64"
        sha256 "48171a455b31e8374437a5c02bde27251247a843192ff3ad5815ba685ee9238b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-amd64"
        sha256 "d7c84438a53a7387779b807bc3317ad20cb3f3663aeab3ca2d34257d6a879c07"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-arm64"
        sha256 "e327ec6660dbbfd36f8859361aa1e88a1ae17d88d4652f1a384490b02f20700c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-amd64"
        sha256 "244a752f9201d6a37c42153505d21ba0b34a327173b258c8b170e4c44018abfb"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-arm64"
        sha256 "e2838013829a8191cba4838de8496f093d4922c44cbcb7b757af142ef9cd7741"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-amd64"
        sha256 "aaaefb7531ec773d5a78f7cd7a14d31f7b0f7da0c8e69a758d99ed5d07644529"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-arm64"
        sha256 "8cf206f774b92e1d9e1ba93845d2f5f190ae1380b4621fb7378db24c61eae516"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-amd64"
        sha256 "058465975419b7ef6394532d9b3119dcb25d5c57f012ba1f1d4457320eddb461"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-arm64"
        sha256 "706190f60ca2ea239b730fc832743a313145c30f20c18eacb7f7e1fb2f0be0c3"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-amd64"
        sha256 "dbc113044a4acd748913df6fd90f24b6d34a054a7bb9d394e939b116074b5993"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-arm64"
        sha256 "67b78b6719f66028b116b3744637e37e8e8b7e10478adb0daecc76347e7042ee"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-amd64"
        sha256 "521b433898ba26ca330267bee8b316545edc3c7e9997475304263a4de10e6701"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/tcode"
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
