class BashAgent < Formula
  desc "Lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.3.2.tar.gz"
  sha256 "a647e51af440a517a5718e5466142a8f4666dbaf4f5be83c48c4f758db37ebeb"
  license "MIT"

  depends_on "bash"
  depends_on "gawk"

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/agent.sh"
    sha256 "e5e48e6186053ad3db28abc9afe4902606345109c666d06e8b0b4c8026ee9c8c"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/goagent-darwin-arm64"
        sha256 "cb5e3b9028bb02a51094ae103da1246821351cb7d489aab131987d56f13f944b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/goagent-darwin-amd64"
        sha256 "d805ccebc4277b1ae0e6b1a88e17bbca4634287f302646d825bc84f077b08663"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/goagent-linux-arm64"
        sha256 "899740d9eff579c59208a14a4ad961443a7a91777108b666369c0cb229b52d02"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/goagent-linux-amd64"
        sha256 "7a44a4879b8282c04164e4abcff569d6eece06e31c1324c5327e5f36df00cc16"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/rustagent-darwin-arm64"
        sha256 "696521ecd9e97ddd0000a7aa22555dccb80202ebe4e3109930fa06318f0e2ffb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/rustagent-darwin-amd64"
        sha256 "dbd2fc8251ced58b9e35538d3bf3e748ddbaf18d37bba9ed8a1d050903e10192"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/rustagent-linux-arm64"
        sha256 "3e76643da272dbf67415735fb11a1ebe949500e4d488213d097bd6ed07b50b00"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/rustagent-linux-amd64"
        sha256 "116dc4a53f8558851b394c615147c9a29105568a43daab7f675402cc48721c1d"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/cagent-darwin-arm64"
        sha256 "20e8179830f61310a0392fbe7eec0da9df42c071e69d0e5b70a3c1cd0a2fd07c"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/cagent-darwin-amd64"
        sha256 "9cefba18b47eaab31507b880299d88a49236ef26ccdf402f0b6e3f1d0f3e8697"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/cagent-linux-arm64"
        sha256 "4d6ed8912255ff9d4769d59d6b1e02643ff452abe714c0e00137bff85b485466"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/cagent-linux-amd64"
        sha256 "523a04f377da6f91dd7f558e1e4d8c447cbf3b0518c8c6f18d8378d476b87072"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.3.2/tcode"
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
