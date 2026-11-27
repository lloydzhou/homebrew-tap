class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.5.0.tar.gz"
  sha256 "a7fff0931e509b03ba2bafb976f4de098deb60607af397f0b78af6ff68986f3b"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/agent.sh"
    sha256 "d585b5078b5e75d7aaf7832b3a8cdeca293384a2432c2b3292e67841be3b3331"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/goagent-darwin-arm64"
        sha256 "3335a157337e053b752394a26ace25472bae8874cc75adf0748444ba7a335b48"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/goagent-darwin-amd64"
        sha256 "2b227fafb46dcae2e56293c804c0df70418825582d530584a8eb990cb18883a2"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/goagent-linux-arm64"
        sha256 "b99df4bc2fb33710095c2e86286283778ff79f9e50d99a23aa9c11e97188c785"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/goagent-linux-amd64"
        sha256 "0dfc29bfd0f124343b3b25ae6ddd3dffcfcf514567aee151fb1652fb08dda00f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/rustagent-darwin-arm64"
        sha256 "96fbe43324449bc61360f769dec12b7d244f58a9705eee6e00326a006689fc7e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/rustagent-darwin-amd64"
        sha256 "1fe90d37b7d670608a66e3d0c6bab42458dcaf75abb71d0f3293af5ab7c25a91"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/rustagent-linux-arm64"
        sha256 "fe9b191841488f003907b964c5b7760c1298954e0905813d88f3ead820e82f5a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/rustagent-linux-amd64"
        sha256 "bc91d11dfe062f4e020f45c1c7f882f51477d9d86cd8506b4a66c2670075fc23"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/cagent-darwin-arm64"
        sha256 "ee51598dd7e145e2a361b9ed7eda1706e43b32eb743a0436d6d1c6e4a3680277"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/cagent-darwin-amd64"
        sha256 "37a3d95046da93377af9f6ed7c37e078d8376393accaab34788f13b3da676987"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/cagent-linux-arm64"
        sha256 "3e7397011a3b915639d530541ae10b934266a1ddaacc42b389d1db714d8f3a7a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/cagent-linux-amd64"
        sha256 "c191aa4c64b7387289973f46aff579ad061eacb4938f6bff37366dc29ebfc79f"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/webagent-darwin-arm64"
        sha256 "59e0894d6add7fa6aa806ff686ce9def2472f36d1219d86a8ced144a2aa93f7d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/webagent-darwin-amd64"
        sha256 "c872a3fc81082393001da1f80db44827b221efc56e56abdb445d647dc407efce"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/webagent-linux-arm64"
        sha256 "fa9c31c5f41e931c7ea5eac9cb6e00796c66e3880894630af7e2dc9ad92eb114"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.5.0/webagent-linux-amd64"
        sha256 "c661308d6a5aeda4677da3074404964596de048a6b73342f631ee1d3fc9a71d5"
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
