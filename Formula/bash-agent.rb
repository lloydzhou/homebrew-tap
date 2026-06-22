class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.8.tar.gz"
  sha256 "7592e019978813aadf8f9a36c7ebdafcce8071c634c35719f79892943a89df14"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/agent.sh"
    sha256 "d7760ee33ae70e6dc311df3fb366e33c1e45ab13c112e0560b8819eeebc53d4f"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/goagent-darwin-arm64"
        sha256 "7efe1de13bc22b9e57f4c2fc9211c9d376b55522544521bb7e45de0899fccab5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/goagent-darwin-amd64"
        sha256 "3993809469eeedf349e0f5860c985e4e4761e474bee08c5a825fec5fda2be948"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/goagent-linux-arm64"
        sha256 "2556bf066d640aea3b3e52457b70bfa8abc625a74c4c31fbe7fb0f6542316abe"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/goagent-linux-amd64"
        sha256 "3c0bef92e4be3d7d886345df75e021b45dbe0823e9720e3d25d34c1e1ef05e06"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/rustagent-darwin-arm64"
        sha256 "3a59b9ab33f779edefd02996330bc5706ec01cae72783ce4bd04d5e6c128bdc6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/rustagent-darwin-amd64"
        sha256 "b39d7138d1828971d0679669453b27c07bbff34830e1842720ef0fb444d02107"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/rustagent-linux-arm64"
        sha256 "3725c3b480891d597abdb1d21fd05491453e5fec48d845f4c348c8b32a1a2259"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/rustagent-linux-amd64"
        sha256 "c03a0bbb5db370e8fb3531f18b50cd71758f1471cee28a247ada809af9c21ecb"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/cagent-darwin-arm64"
        sha256 "25776c0c094e9da97d71e750c3a46805766a085786b142aa0be553aaf3bcb032"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/cagent-darwin-amd64"
        sha256 "6007c3ab80ea4a3fe105f770f877727c9c9e065f9e0eb731e41c1fb0c76696c9"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/cagent-linux-arm64"
        sha256 "3b160014c9bd1ac4b1d011cc67b7566e8a87c45a75f613f9fc8983c6cf43b59b"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/cagent-linux-amd64"
        sha256 "16204439ea2f0f66d5186273f2635b68b3cc83d65c1a2cca0a1fbc9926a6462a"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.8/tcode"
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
