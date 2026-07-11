class BashGuard < Formula
  desc "Claude Code Bash Hook 的失败关闭权限检查器"
  homepage "https://github.com/lloydzhou/claude-bash-guard"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f2fb972402c5acbb25cef6af568af627f10c40c3f9394520acf5bc5d40d1e19f"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c032796c51125d125f1c67250721548623362186346030b417b2d4b530deb0d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90d90766a46fc269d8107df2603654bf3a63d79100f5df77fde694a8b1b3076b"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v#{version}/bash-guard-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e99cf8b273aa7ac09cfb6cadf45eb3e80950794cedfe5e20ad3cf06661a1b5c"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output("#{bin}/bash-guard", 2)
  end
end
