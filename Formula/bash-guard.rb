class BashGuard < Formula
  desc "Local-first safety gate for Claude Code and Codex tool calls"
  homepage "https://github.com/lloydzhou/bash-guard"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.3.0/bash-guard-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "c5a9b6937db555c172f9866153f088c34e333ba5db1b3e81b15dc974f2de6209"
    else
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.3.0/bash-guard-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "33d6c7d8501a8c4836360451b2b673194583731c33a49bb96a31841e936c8efe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.3.0/bash-guard-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8938e06ad6e91c321300f92d31684c3879bb6dacc2c8b85b6ae37f813022e06"
    else
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.3.0/bash-guard-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b413e2bd58d7d029ef07b589d1c93b48a6719db586a666c0bb8494599a2e42c8"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output("#{bin}/bash-guard", 2)
  end
end
