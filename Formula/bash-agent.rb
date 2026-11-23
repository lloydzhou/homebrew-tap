class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.4.3.tar.gz"
  sha256 "cd5067cb0deb46f6bad5a6a939513589d4904c2e01f3d5db811ed98274495854"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/agent.sh"
    sha256 "55494c1cfdd2de57d38f17dfd32ea667f26764a2f8bdabd3fdfd0b478b984e35"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/goagent-darwin-arm64"
        sha256 "64a7b3d441f1cba8b99dfb6ae2eca2f77e66d228d40aa2d2e922d0802f895fd0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/goagent-darwin-amd64"
        sha256 "c549e143dddd6973113ae14fe68042e2ec921fcc78a9d7440688890a3aeb5b4f"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/goagent-linux-arm64"
        sha256 "4b2f999df7a0671958a4356cac21ab0c35c3df8c3472aa0e674438b3c1817a0b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/goagent-linux-amd64"
        sha256 "5ccd01b14ece11fa31282a348e4833d98bcb78698f00edc9ae2c9b48986e0b3f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/rustagent-darwin-arm64"
        sha256 "d1e0828f80697776c04144bae1981001e4b1a6c7e2046a08eb8cb4c814b69faa"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/rustagent-darwin-amd64"
        sha256 "243afb7e07b352226048c94de51a1d6f9cc9a675c406476061d0021fe20d6aa7"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/rustagent-linux-arm64"
        sha256 "72d7059578734921a6b4e3ba267466b97d56127c773db885aa6d175a8402f354"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/rustagent-linux-amd64"
        sha256 "17f4fc6ad65c973eac6e2e14cd497d653ab187fec92df925fc419fafa0b33e6f"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/cagent-darwin-arm64"
        sha256 "6f73ca904390e49ff7ee4bc07408fd50145c96eef6cf70d75eaa846c8a40990c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/cagent-darwin-amd64"
        sha256 "e652dce34857b567722ba6dcc1c5589ef1122f77220d93f8b260e76f8f337f22"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/cagent-linux-arm64"
        sha256 "10b76d179a0c52183ad9f7edf1d7de22fa1c67cbe5e4ba3a72131bbfde178665"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/cagent-linux-amd64"
        sha256 "0a015a5d10b4a405e8312734f27ec9878fdf4bb3ba4d5585e7b763f5f7776456"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/webagent-darwin-arm64"
        sha256 "4d942e20159efb8597e57816e4b09da11a81e9c867d763eefc6b706257c37d41"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/webagent-darwin-amd64"
        sha256 "ff01ee00a25c1a69cea30553b1f05985dd65a28174ba481d7fb5002e49c6fe29"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/webagent-linux-arm64"
        sha256 "561901d6a73e7175b41ce9827c2c6ed101e76962394841633853a0814435852a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.3/webagent-linux-amd64"
        sha256 "bedda5325314dd7fa3ff8107676430fd9bacbc8d8ab8a40de042e8721ab7c533"
      end
    end
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
    resource("webagent").stage { bin.install Dir["*"].first => "webagent" }

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
    assert_predicate bin/"webagent", :executable?
  end
end
