class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.14.tar.gz"
  sha256 "77a39976159dd3faee0cda5d644e7720cadc8a5d105c791ec17677f7d97b4b61"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/agent.sh"
    sha256 "d16e7bd559d6d0b0bf4cd14facd8d6891f68a0183a7df5505bb52b6b4785e955"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-darwin-arm64"
        sha256 "343beafaad45a9aa5397887a47fea87a71be6d3b4d251fdccec4d3c4188ca4c5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-darwin-amd64"
        sha256 "55baf0e3eeb2770d48db3f2373a73bfeeb11640e919e55145edc855e30876aed"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-linux-arm64"
        sha256 "5d04d12875c497cc736e1b33a2dc1d8adf16ebe6c004af8808b80bed9c940e77"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/goagent-linux-amd64"
        sha256 "6d369fd0ee63040eba064f78e2b063e09dde2bc4267a86ba923e01a25b6eca08"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-darwin-arm64"
        sha256 "01d4e0ad16c0d4275a371936d6e0fe5bd236d4f3b8743fdd232d628b9b4cc6a8"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-darwin-amd64"
        sha256 "b89aa309049657348654c32cda42bc49b25a3469ef38d8e0b711c307ebf96ca2"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-linux-arm64"
        sha256 "13e160b5053bba0848b82ec09e2d05c106aa072977b4b0b9d6cd036030d224e0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/rustagent-linux-amd64"
        sha256 "20f5c54fa9eb14f167b29b33c2d9e4f6d7b969d88573ef772326b1bc4b3a45e2"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-darwin-arm64"
        sha256 "26c309ff512962a4548486796d8f868b7452e9cfbc49440bd7397f2a931dab1e"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-darwin-amd64"
        sha256 "2e05ed07bb2e365c6a98ec24d7a64e55e870aefb6d4028bbf4fdcd54f8c48a61"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-linux-arm64"
        sha256 "a826e3f436b2eb1af5d74f64a296bf4b979d5b7a8debb9ece5253c7fab0824b0"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/cagent-linux-amd64"
        sha256 "b4b4d917b7735c7f1e02a20a9eac59a22832c550d865ccbe7b5152f7469c96be"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.14/tcode"
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
