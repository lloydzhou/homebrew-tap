class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.21.tar.gz"
  sha256 "6c779477b210fda844a1a19b03d2036f8dc284aa1bb8b4ae5a4fdfdbd1213012"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/agent.sh"
    sha256 "486381ac26de2075ea68a466e9328745a61d8e36f12b7397d9cee1c9a10ed8d5"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/goagent-darwin-arm64"
        sha256 "353a98cd4ae4de17e5450f75ff10de0d5fee9180b0c8ee2ff4c046b623456179"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/goagent-darwin-amd64"
        sha256 "9fd08c6ee27e24fe7e9e1fcb1857a2c55b84fcc95d6222dbb86549f151507662"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/goagent-linux-arm64"
        sha256 "72377621b2464c485e855047ee7ee98531d2e3937b5320ea6926eecfe03cd34e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/goagent-linux-amd64"
        sha256 "d72cf24542fd278775b922898521e642fc77267332a3c5c84d2ffb29114e1700"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/rustagent-darwin-arm64"
        sha256 "0fe1d4d29b9dc5821c74dd68d0b722e756b92cb85c165b74dee5977da5e12598"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/rustagent-darwin-amd64"
        sha256 "978d380d1912c24d3106a170d15330a3c64b1e99b9cede1bb06ffee3f14db621"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/rustagent-linux-arm64"
        sha256 "d9624eead4404f1ed91847fd409d969a66262d6d72082378b1ce160832348df5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/rustagent-linux-amd64"
        sha256 "08f34bed0bbca2a99cab8c40af794fc52d8281a3b262df5186229e1b1321fd20"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/cagent-darwin-arm64"
        sha256 "65cfc1357645a34b9ee80d27ce0a0fe085a87eac72ace02dec78e28c74a90af4"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/cagent-darwin-amd64"
        sha256 "916de792f3884f4d6757ff7fe888f3b9d4014578ee2cec9ddeedb4eb1fcd9f73"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/cagent-linux-arm64"
        sha256 "78f4815be608392161b8fcb9610b4e00cfde684fc58da7bd54e8974ab00a5189"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/cagent-linux-amd64"
        sha256 "d80961c187deb08907a02bae53d10ff27a5554dcc083d9639dacbb994577881c"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.21/tcode"
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
