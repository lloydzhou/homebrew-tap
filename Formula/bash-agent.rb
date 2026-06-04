class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.1.1.tar.gz"
  sha256 "4f0f1864aa128a2cc6845c5361c387cf0f7e3002d1d3fa5ec5fbefabeedc129e"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/agent.sh"
    sha256 "8b4e99a70401895f6c526561a05596e5782d2fdc1add3f6dc8ded5575c521e53"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/goagent-darwin-arm64"
        sha256 "2fffb702ee69aa39f8d793aee2ce78022baa9501fd91ad91de05ad1b7941a234"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/goagent-darwin-amd64"
        sha256 "f0cc36a014550e60d881085f189317a2ce4341df6ecad2ea96c7286a679d602c"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/goagent-linux-arm64"
        sha256 "3573910b906a26721ec0cd6bac9d83a384e247dc8b6c4259710776a8192a85f9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/goagent-linux-amd64"
        sha256 "8e174616e0505f0195665972ef94e95dec56801c6339e60fedcaabbdc2049cd2"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/rustagent-darwin-arm64"
        sha256 "e454e837bcf9aae6c173869d1ffc7aa7c7f181947a5e55a20e12740410e19bfb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/rustagent-darwin-amd64"
        sha256 "eb71d9da51a1618257cbdd57dc4b0c1b3e2a65fbcfcf9a00c6cf0940f7c5cde4"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/rustagent-linux-arm64"
        sha256 "dafb0bf3eaf95e03e4a8dcbe29df97ce37acd93e6e1bdcf511195b9a1a959f42"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/rustagent-linux-amd64"
        sha256 "b9562b545bf1f8032efb9f01d27264f5df5fb7cd8028ad08200c4757027d4c12"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/cagent-darwin-arm64"
        sha256 "4ee4e2ade88b776fd38976fcf10eaf04f96f7c6736774c9c57eb424565b8eb1d"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/cagent-darwin-amd64"
        sha256 "e77573ef032bb1e4f5623be08a48246ec2ccb2087aeb8bc267f468357247008c"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/cagent-linux-arm64"
        sha256 "0bd253fee14c0d57f32ea27f2652a007d5e2f47dc23c23d42df6e353793ca26b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/cagent-linux-amd64"
        sha256 "52dddd65fdecc774bfe6759382e554667e973940dabcd53c6797828dabd09c3c"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.1.1/tcode"
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
