class BashGuard < Formula
  desc "Claude Code Bash Hook 的失败关闭权限检查器"
  homepage "https://github.com/lloydzhou/claude-bash-guard"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.5/bash-guard-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "159543d7c925d676a93d3867b7acde66d50f8e785f73f2cf1a2bc83053f97729"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.5/bash-guard-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "d895e4d37ec8ea0aac4806566606827f44dcac98c9213d178f844ddaaef0198a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.5/bash-guard-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26aca4fbec6acf2288c19f5c0750db7eb20eec4c1060fb1614b098b8ebf41db4"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.5/bash-guard-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c164869d1e7aadb6c8f7cfe3f44ee8d36ef58b4bef8d9a89edff236a779bf0af"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output(bin/"bash-guard", 2)
  end
end
