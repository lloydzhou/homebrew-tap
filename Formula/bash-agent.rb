class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "1c60b62162c32c68be5b6c27960793f64e7d942ec0625bf75df79c9c50ad7f44"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  def install
    # Build Bash edition (no compilation deps needed)
    system "bash", "scripts/build.sh", "dist/agent.sh"
    bin.install "dist/agent.sh" => "bash-agent"

    # Build Go edition — only if `go` is already available on the system
    if which("go")
      ENV["GOCACHE"] = buildpath/"go/.gocache"
      ENV["GOMODCACHE"] = buildpath/"go/.gomodcache"
      system "go", "-C", "go", "mod", "download"
      system "go", "-C", "go", "build",
             "-ldflags=-s -w",
             "-trimpath",
             "-o", buildpath/"dist/goagent",
             "./cmd/goagent"
      bin.install "dist/goagent"
    else
      opoo "go not found — skipping goagent build"
    end

    # Build Rust edition — only if `cargo` is already available on the system
    if which("cargo")
      system "cargo", "build", "--release",
             "--manifest-path", "rust/Cargo.toml"
      bin.install "rust/target/release/rustagent"
    else
      opoo "cargo not found — skipping rustagent build"
    end

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?

    # Only test additional binaries if they were built
    assert_predicate bin/"goagent", :executable? if bin/"goagent".exist?
    assert_predicate bin/"rustagent", :executable? if bin/"rustagent".exist?
  end
end
