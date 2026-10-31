class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.4.0.tar.gz"
  sha256 "1ee42a00cb119f5ea1e7adcdfba3225a8a3ebc3a32b6e2208f82dcbe50b30ff1"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/agent.sh"
    sha256 "3f97e1f92a00bd2fd6efd3e519fee776815e4ed84866e426469312df77dfc1c4"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/goagent-darwin-arm64"
        sha256 "6fd29dc36c4223d4d2d3eaca9cb3746849c10e5bea506bc2f28570df82c9ce71"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/goagent-darwin-amd64"
        sha256 "d3d6a514906cda387c34d7613acd6a1277faaca06bec7014f27fba54ea7b5253"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/goagent-linux-arm64"
        sha256 "d0e98ce59cf51da327e71194d844caf6f11d592d8ab7fa7e4062c656f3c3b58d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/goagent-linux-amd64"
        sha256 "9881a03a0712d728b4606e02b4cc10c5c2768b987a3dd836fc15954e703d8906"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/rustagent-darwin-arm64"
        sha256 "acb0d0458690f2af116d8c834dd08ca629f82f21e5a8b4950add9d6f5d134250"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/rustagent-darwin-amd64"
        sha256 "1c8d2a63d111d2ba4671a85560b7fb544d87a252c9500bc11a142f117711a8db"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/rustagent-linux-arm64"
        sha256 "12953fc72c8ac2dce29fc8f8bd7ea84879598f167cb63df7372c455b2be02b21"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/rustagent-linux-amd64"
        sha256 "bcb5fa15c13e8108904807c99de933aa923310b659e1a9b3068fc6fb39000319"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/cagent-darwin-arm64"
        sha256 "2d1044f917fd1a56f3feb3684d203ac43e44a4b0fbff79a24672649f9e43eb7e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/cagent-darwin-amd64"
        sha256 "68b4315207f805ae6d66f542d348b1a7b88d09ea7de5d8aafb69abdfdfcecfa4"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/cagent-linux-arm64"
        sha256 "b26ebafa43f874c37d230d6565d15b95bedec1efe6bff76fa3123615fc0f5515"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/cagent-linux-amd64"
        sha256 "4482b24b088f7c7b4984e95d939445e59878531c34b8c2a53d34113506ed5b3a"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/tcode"
    sha256 "b55157ce288da68af6f54870421d6d48eb7779a570e93c61073098ee55d846a2"
  end

  resource "webagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/webagent-darwin-arm64"
        sha256 "9692a0c39bf3e237fcbb8a222e81a6a0a9a4b22294902d73f85263420441e34c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/webagent-darwin-amd64"
        sha256 "f84ec5d2fecfdb2f04f4aa06fc8703b53c86e09fed1ef87d1909aaf88fd52fd0"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/webagent-linux-arm64"
        sha256 "2ed67c427bbb06a494f66399102f3e0af46f3d8b003f411745fc5f6a454e48a6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.4.0/webagent-linux-amd64"
        sha256 "96b64ec32357a71c8ac27e45970617a6bc677f598b90a5b7b3a1b1d0394924f6"
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
