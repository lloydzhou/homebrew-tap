class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "1c60b62162c32c68be5b6c27960793f64e7d942ec0625bf75df79c9c50ad7f44"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/goagent-darwin-arm64"
        sha256 "06fe6952073cb09e1bbfc7bd7eb7201fbf07dd635692b748c0598a6885493e5a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/goagent-darwin-amd64"
        sha256 "6d4bce9959249411930413debf671f695d53683f3c3d8de66a178e64e7640230"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/goagent-linux-arm64"
        sha256 "478b9a25417458b993d1836f6d654cdee6e68ca68a47c9ce3366f17fe2027e0f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/goagent-linux-amd64"
        sha256 "1374888452e6d1adabba7b7047555d9ac12fa29284f1123938cd8191d97ebd7e"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/rustagent-darwin-arm64"
        sha256 "3fb141aacec491bac421998a603e2371ed21f2808e39f1dca702c5697a5ad1ab"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/rustagent-darwin-amd64"
        sha256 "1bb120706f1d6e28a292a045c59f8537b444f6d0c2bf8c31750f30a625442d93"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/rustagent-linux-arm64"
        sha256 "9b731884e9060ad15e7657d9be0eec7281669b14274a36488b11ba5cc79ffe98"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.3/rustagent-linux-amd64"
        sha256 "6ca9ba455513b41eb1dc5c2df113f5a8a8aee61b980262f06828ca5a802f500e"
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
