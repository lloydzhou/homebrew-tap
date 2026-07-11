class BashGuard < Formula
  desc "Claude Code Bash Hook 的失败关闭权限检查器"
  homepage "https://github.com/lloydzhou/claude-bash-guard"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "af69c7bb30160f5dbe8fcfe0716be6c025032903d6c3c6e489ce5fc98907b625"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e5bbd3a18e04c4a7b04edf04e6eceace6eeec4240520981a3c77e67a3632db37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55bf95be5221bda43e87fffb0d31735282ee8d01ff9fd33dec3e53f447b88172"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35623f62c89b6f90a7174e96be5339dc6710ac32772f6f893583c3d28e00e32b"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output("#{bin}/bash-guard", 2)
  end
end
