class BashGuard < Formula
  desc "Claude Code Bash Hook 的失败关闭权限检查器"
  homepage "https://github.com/lloydzhou/claude-bash-guard"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.3/bash-guard-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "d5ce3c6d0d33f46c0f3a47f81f3fb42d74452f9962f7241c9efa6bd5e9623f7e"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.3/bash-guard-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "9d2f1e12b2d9426fc487ece495ea6432e087688864ff8fb1cdc74f86fd2e411c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.3/bash-guard-0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87c353b68df2e763543a5c17bd90726a2c26cc00e1e403865210689434470940"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.3/bash-guard-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e12ad1e342979d515080d422427feb07109df91f3fdeb95be0aaf35fd76a0705"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output(bin/"bash-guard", 2)
  end
end
