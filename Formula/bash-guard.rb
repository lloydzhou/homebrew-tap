class BashGuard < Formula
  desc "Local-first safety gate for Claude Code and Codex tool calls"
  homepage "https://github.com/lloydzhou/bash-guard"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.2.0/bash-guard-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "f5fde3d79f86eed842cc0206c2bb12ed9865aba4557f3d9ced6cf4f5283543bd"
    else
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.2.0/bash-guard-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "2e275a30d296f515c8e7a01d968b75a0d113502c3897c0e25d8c211978861833"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.2.0/bash-guard-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe48541458437d7003313134ea30554978193bf194b7274f07c97d1218c34960"
    else
      url "https://github.com/lloydzhou/bash-guard/releases/download/v0.2.0/bash-guard-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc3315d7d5066e487e66922c8e53a0718f6caaa91436ee3bf5019c53969a3826"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output("#{bin}/bash-guard", 2)
  end
end
