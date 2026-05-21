class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.4.tar.gz"
  sha256 "30a5c25ba6b50ef24c126249241c92ad15e2c2a46966fcb7385b6d551a686721"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-darwin-arm64"
        sha256 "448567118ad0ec659fdd90cde86ac4451375bcf2482e9aacb578afbe6743acc9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-darwin-amd64"
        sha256 "1b628bdbf9d8d257439963138df0c383d4f3bf025b99a941a4ce043bde3c9a28"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-linux-arm64"
        sha256 "54aef339a4190a76888d06b14bbe63d360ff1d6377f74abc80d66f598618af03"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-linux-amd64"
        sha256 "5a20133e50108a60d9f3344e654e6c92797f98c4514c942cd49d722c3cde9a82"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-darwin-arm64"
        sha256 "ec24f944245476f4b914222048679a362ee8d319a08ede0fb47aaf27149e1f27"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-darwin-amd64"
        sha256 "7c2f7424b674ac6930ad20a4d8cee4acaafd0eb17c1a7eb6ae72b6307b6d54bf"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-linux-arm64"
        sha256 "8f5e1810dbf6a01a63d3edfd1478c5322beb560ee9f4d375436ba818c26a49d5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-linux-amd64"
        sha256 "1e1fb1723dc3c6b59281c629dba057a378aa10f9d4d8d233a5cd3a98ac3f8d6a"
      end
    end
  end

  def install
    # Build bash agent from source (fast, no compilation deps)
    system "bash", "scripts/build.sh", "dist/agent.sh"
    bin.install "dist/agent.sh" => "bash-agent"

    # Install pre-compiled goagent and rustagent
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
  end
end
