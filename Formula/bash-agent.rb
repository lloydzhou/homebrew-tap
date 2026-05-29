class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.4.tar.gz"
  sha256 "5894fc64df91dcf84677259d53ef1c0d268cabcf89d55799c100f15c8d4ddab2"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/agent.sh"
    sha256 "64d0961d242bdf13da3bac026b8442e8df8a2933e09ff65f8b93bb815c78f74a"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/goagent-darwin-arm64"
        sha256 "2915c88bddfbf3c5da0d830561521e85f76811216aebc4a4a4655a545502b811"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/goagent-darwin-amd64"
        sha256 "2e74474315c8c076131e11ad7c1e5c1830310dfaddd906f2fe995cff44948dcd"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/goagent-linux-arm64"
        sha256 "ee6dc11bf8193af46c8a5be56f47009c6206a2b9463491297e3dc5dfaa18b6dc"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/goagent-linux-amd64"
        sha256 "492485caa9ad8360622f778ced16097f4c00f5ced767823e7ddc5c5ef40c163f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/rustagent-darwin-arm64"
        sha256 "e1def5e3beec338119d67a4f1591ef1b974a661a50ccd2f7b7aa55e692a02cbb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/rustagent-darwin-amd64"
        sha256 "bf6f2801057decbf10ca94c0b69d24de84aa9dd2412c41ca4febc1b2f5b5a7f9"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/rustagent-linux-arm64"
        sha256 "d4f64e538489e874056fa1b7e090bfa580fb9fab29a3055ed0674f324a1979e1"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/rustagent-linux-amd64"
        sha256 "ac849e52d0efda39e3f8ad2fef97002326cf635df22076ca6ca6027e451296c0"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/cagent-darwin-arm64"
        sha256 "c0b43fb594f93909e2683880b6a3660d64b202bfca764c10fd87e6b3822ce035"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/cagent-darwin-amd64"
        sha256 "94a45c67278875a2e4feca2bdf1c617dafb587f9d9cf81660f65fbf04ba76534"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/cagent-linux-arm64"
        sha256 "88f949b584aacaee71c108113e4eeb7630dbca7b9b1fda0ae46de4b49c9e1350"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/cagent-linux-amd64"
        sha256 "fde29af99b935f645e3d0decac1dd91875b27e98af2483ba5cc58b18e7bbfdf5"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.4/tcode"
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
