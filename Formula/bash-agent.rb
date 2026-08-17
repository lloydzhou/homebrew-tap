class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.4.tar.gz"
  sha256 "aa855be69b7911220dd13e2da1b48868342d4d1ef1f461e2d12eae7184d0a68e"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/agent.sh"
    sha256 "c05e12998a18fa04da0cb0e168e690650011a2cf3c5edffb2657ec2ee6815dd1"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/goagent-darwin-arm64"
        sha256 "acdc170f3a70864d0be51d2bcff9b6f1fea647364a6d96da1931da1137600906"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/goagent-darwin-amd64"
        sha256 "d006d97bad47f9fdcd9c4574734716c8c9bc8b6f15f70bb55996ebcc99ebe226"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/goagent-linux-arm64"
        sha256 "a443b732e1c72711cebc3e60e9a3554fadcd1c2452b55019e3a53d56c723cf2f"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/goagent-linux-amd64"
        sha256 "d6a79854ad061a669aff72b25c386067d6b302607fa397229c2ef147577328f9"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/rustagent-darwin-arm64"
        sha256 "04cd483908db97ec76dacde65d1c468579b339b244025fa6fe1d8e9ffa404441"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/rustagent-darwin-amd64"
        sha256 "19dc8f1ebce223853c4229cf6984dbd2949451bce9162e790702830ea20e5d93"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/rustagent-linux-arm64"
        sha256 "5eccb7b379e644320e356fb916473ce447f75767c822fdcffeeb4e3043e99444"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/rustagent-linux-amd64"
        sha256 "88f1e915224f3377abf30c608c443e8ac5812121b601c59bec5fce8f3c07c78e"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/cagent-darwin-arm64"
        sha256 "633d41964a756a21b7714e935c8028bb7777a612953ee51ddd6500d66763b1f1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/cagent-darwin-amd64"
        sha256 "f8ca28ca979d9c9feaddb3b3ec6781ecf7ac85d860af4b78ae294180f4be504b"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/cagent-linux-arm64"
        sha256 "7f2b88c34b8948f9f97275f41d3cfd54e0b4ccc1817441ed30dd462c6460a99c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/cagent-linux-amd64"
        sha256 "40ae5c3fbe4ddac7a2540beaf87206017424e32996b870ef0cd3336ca7f09497"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.4/tcode"
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
