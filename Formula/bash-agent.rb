class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.2.tar.gz"
  sha256 "cb02781ea586219d9a2c3b5383bc3347da5b761176dfe2bb1492db6a5622e0e3"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/agent.sh"
    sha256 "aa9e0ed3a5684882c2a580a443d7026082f9a484113ff7db2085e6cfec678720"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-arm64"
        sha256 "e88951a56850ebb5b243eda3807d923f71c443cc2f4c6b1cb2ff9b193bdb7649"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-darwin-amd64"
        sha256 "132350e04b0b8929106e1857232b0522359501c7535b8db77382e5e40b2fb084"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-arm64"
        sha256 "7ab56dfd5b130c88d40e9c94c8c25c3f7b10d925c790371845ed33e3d559c891"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/goagent-linux-amd64"
        sha256 "e48a721fe7304de55531c93be97d6984f84e3c9cd54c52db9e56e0e63642f159"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-arm64"
        sha256 "5c05cfef436cdcdac1e6e8298104a9e6c0ab2e786852a94ed144f74c17ae3be5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-darwin-amd64"
        sha256 "d3e2327cb66b6050e07b2c423807718580591c3c88f539bd2b6eb36cae242c86"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-arm64"
        sha256 "a17441ddf6fb302216b9242614fbb79daa84ac53356c8f86edcfc46f0103bb7e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/rustagent-linux-amd64"
        sha256 "a0dd1645f2e7c59cc910a45470720554726624ef42c1ed754f8dab1bc7e33a73"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-arm64"
        sha256 "5626d74f25fb8c0bf689f8214daaaf86e283733eb2a04d1d6760125c821e6031"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-darwin-amd64"
        sha256 "6fd11768a96bb4906d456187823ea25f0079712c56b5fd1e288a24fb40b934f6"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-arm64"
        sha256 "043760b71116d3fc25e5e66833e35790a1727e2bbfc2322d6c976bf95f42c339"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/cagent-linux-amd64"
        sha256 "8f4b51fd9e17e9e45eba5c89edcaf7914f4c44997c5545d7ab426a0f2ee9c3c2"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.2/tcode"
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
