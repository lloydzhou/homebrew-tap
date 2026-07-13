class BashGuard < Formula
  desc "Claude Code Bash Hook 的失败关闭权限检查器"
  homepage "https://github.com/lloydzhou/claude-bash-guard"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.4/bash-guard-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "f07773e1abdbc6f571f3b818685eea5577145bf974ded30553aadd7f547d8e7a"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.4/bash-guard-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "eb06faf31d48f9c5076a2694046041fa18bfa22fab32dd24c7bdbd39f4d834e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.4/bash-guard-0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3178a0a09f199a47c7024d3e4efa3d65749211e6fe4917a401fc2ae63d7c02bb"
    else
      url "https://github.com/lloydzhou/claude-bash-guard/releases/download/v0.1.4/bash-guard-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc2edadd55703b46a71fc8e802844924c96544d2b7a25e5eab30b502ae12d9af"
    end
  end

  def install
    bin.install "bash-guard"
  end

  test do
    assert_match "用法", shell_output(bin/"bash-guard", 2)
  end
end
