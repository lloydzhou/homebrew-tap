class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.6.tar.gz"
  sha256 "6dedad74f749a8a54b7cf1c9007b17aeb89157d70e97d28e17437eb46a42f2d8"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/agent.sh"
    sha256 "98f6c5b54946aa94544a1a6064eb64ba0bc7a8ac3c518cb953ecefad37d7077c"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-darwin-arm64"
        sha256 "e5dee7a2c54ba8d693b0c53a796530730a0eca2dff70ce6f5f55dc9da3af4938"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-darwin-amd64"
        sha256 "0957b611ef13ca52593e2faefcc51d2fdc4ab82d587d8987dffd13ed0abfa60d"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-linux-arm64"
        sha256 "f932f687d18330210eb9072be4f0f31042a15d93f9d7b87c6f4643cf8a61223a"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-linux-amd64"
        sha256 "ff869eae02bab7984c1d5f7dbf961c71a10c2872f8655174a0340aa71a8682db"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-darwin-arm64"
        sha256 "0bee48d253dcbf02b456a1c6a7ddea3bcc0d17e95be75a5fa278bd90ef69c043"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-darwin-amd64"
        sha256 "23f4ecf72312f3a1482ee1c9f77329517ee05e15021e23601fc9e946747f68eb"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-linux-arm64"
        sha256 "684f79ce2f9e37b38bd5cf581f1685baf9cee03ce5b12c9ad80f362eccc999b4"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-linux-amd64"
        sha256 "6c7cda8dcfd86b95851712feafc462bd81e9e14ba2a2a4c76ce1679711493099"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-darwin-arm64"
        sha256 "05e76000a1735a98ac0c46c1a27dcb9c8537967668ca76c3d3d43615b9b1e862"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-darwin-amd64"
        sha256 "1e092ffd14f3c84e3670709236603a33963b2cbe94273cffa9cae1bc9be7c13f"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-linux-arm64"
        sha256 "03c7ff4be29293347b7954d2907494fa5f0e3d03124c264c0e2d7a8a9900a870"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-linux-amd64"
        sha256 "631e92304a7ae28e1b8d37f87a5ffff99777d6eed5a832463863ce63948cafb7"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/tcode"
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
