class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run
  depends_on "go" => :build
  depends_on "rust" => :build

  def install
    # Build Bash edition
    system "bash", "scripts/build.sh", "dist/agent.sh"
    bin.install "dist/agent.sh" => "bash-agent"

    # Build Go edition
    ENV["GOCACHE"] = buildpath/"go/.gocache"
    ENV["GOMODCACHE"] = buildpath/"go/.gomodcache"
    system "go", "-C", "go", "mod", "download"
    system "go", "-C", "go", "build",
           "-ldflags=-s -w",
           "-trimpath",
           "-o", buildpath/"dist/goagent",
           "./cmd/goagent"
    bin.install "dist/goagent"

    # Build Rust edition
    system "cargo", "build", "--release",
           "--manifest-path", "rust/Cargo.toml"
    bin.install "rust/target/release/rustagent"

    # Documentation
    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    # Test that all three binaries exist and are executable
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
  end
end
