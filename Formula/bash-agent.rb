class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.3.tar.gz"
  sha256 "1c60b62162c32c68be5b6c27960793f64e7d942ec0625bf75df79c9c50ad7f44"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  def install
    # Homebrew sandboxes PATH, so add common tool locations for optional builds
    ENV.prepend_path "PATH", "#{Dir.home}/.cargo/bin"

    # Build Bash edition (no compilation deps needed)
    system "bash", "scripts/build.sh", "dist/agent.sh"
    bin.install "dist/agent.sh" => "bash-agent"

    # Build Go edition — skip if `go` not available
    if system("command -v go >/dev/null 2>&1")
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

    # Build Rust edition — skip if `cargo` not available
    if system("command -v cargo >/dev/null 2>&1")
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
