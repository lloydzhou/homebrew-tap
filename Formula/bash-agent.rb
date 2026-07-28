class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "6b3d9f8c473abec84b2dd7f18b68567181bd2089eb2852b90d85312cdf15f7a7"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/agent.sh"
    sha256 "e5e48e6186053ad3db28abc9afe4902606345109c666d06e8b0b4c8026ee9c8c"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/goagent-darwin-arm64"
        sha256 "88ba37f02216297de6f0744ec994451f198e69a2f140510fe9e1b9a75e0c2e57"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/goagent-darwin-amd64"
        sha256 "6515fd8de4065a203bc146b8006b7fa5567549189c92db6f5e3a74870ed3cfdc"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/goagent-linux-arm64"
        sha256 "776a3659311ac7d92adcb362610cdf7fbea50c442b30e069bec367da501d3943"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/goagent-linux-amd64"
        sha256 "5e9e93e6e364f67b7a3f63066c2b171d345c6910dc5c52cc2e37a8d9fd3eb315"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/rustagent-darwin-arm64"
        sha256 "696521ecd9e97ddd0000a7aa22555dccb80202ebe4e3109930fa06318f0e2ffb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/rustagent-darwin-amd64"
        sha256 "dbd2fc8251ced58b9e35538d3bf3e748ddbaf18d37bba9ed8a1d050903e10192"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/rustagent-linux-arm64"
        sha256 "58205d986f35ceff48cf9eac85f9c29acd426555d1990e1c93e94f4b1f4d612a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/rustagent-linux-amd64"
        sha256 "8ac6e9a1ed999fd1aec52d3e83c4e2b85ef2630cffa5873ab77a8301df7bc1c8"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/cagent-darwin-arm64"
        sha256 "e03800b70c30dc8335a7864464e5b46821c8df04f254d131ce30f6c463b13c5a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/cagent-darwin-amd64"
        sha256 "cf9b175a61a0a6c130844661003fa178a597ad9e0d5d7d7783338d8d97b9b29c"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/cagent-linux-arm64"
        sha256 "8787534e729b26de3c0f3b26b632fa46a9d9b298f0b2ef01037b6f6898d884b6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/cagent-linux-amd64"
        sha256 "fea137289c7e8fa769288febc535db6545ddc67ec179a1e9392418e5947b481d"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.0/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
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
