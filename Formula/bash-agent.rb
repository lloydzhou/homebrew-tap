class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.2.18.tar.gz"
  sha256 "6a8742af0d8b771976dd91ee65f7c725ba59b4034981a9a837bfe6ad3fa00415"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/agent.sh"
    sha256 "b4d82cfd6c9f18978bc75c5668f345db18c7d9a9a4030bbaeb705d280ef4308e"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/goagent-darwin-arm64"
        sha256 "a050cb0b19d5d33fd74fbc2330be62401dce8044bf8315ea368329d1ae514a11"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/goagent-darwin-amd64"
        sha256 "5fb34db301a35d676a4636b982df5686921fb9a6325cc0667d3a969d005f61f8"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/goagent-linux-arm64"
        sha256 "7fea096fef1664c7e73096d873b4f2901043955adde79e3628a31631ca697e55"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/goagent-linux-amd64"
        sha256 "a4cc4a26ecad280f1b067665034be94bff26ec9ec4f3f4c349dd66f9dc9ee662"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/rustagent-darwin-arm64"
        sha256 "08a08a81e47a9d6f74e549bce56034cf17612a4cf1afedb62db6b4930e1196f5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/rustagent-darwin-amd64"
        sha256 "1b228ba77524d34cd9ac1539384cc9d7aa62edab5239cc3def6f96f83c0782d4"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/rustagent-linux-arm64"
        sha256 "613785397a1207f681b7523c2ca3f5855dbf924b0cafc69f7e0d48abbfe38941"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/rustagent-linux-amd64"
        sha256 "34144d6a4831d546f7b42c058ad80e52f65bdd76ae03f15d4af72fc639d094bf"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/cagent-darwin-arm64"
        sha256 "1864074b9162ad804a0333b5f39aa697db3a8005e189a67ac9b62c18db574b92"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/cagent-darwin-amd64"
        sha256 "a40e90aa6475566d835f1b7eef04e50654180381381f0a4c83244eebd767bbcb"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/cagent-linux-arm64"
        sha256 "1f3cb9ebc880e43153f1e669ef5c1160aa3deec1329dac0bd8384f7f773c70ae"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/cagent-linux-amd64"
        sha256 "2aeab8bc1cc7e36fb40776ce1f44482d172f26a0a1ac89d4bdcdf8b1669e77eb"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.2.18/tcode"
    sha256 "74aabd0135a1a8e2d0d399e372df8023f257552f84bba7fb3a459ba5f3962ae7"
  end

  def install
    resource("agent").stage { bin.install Dir["*"].first => "bash-agent" }
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }
    resource("cagent").stage do
      bin.install Dir["*"].first => "cagent"
      bin.install_symlink bin/"cagent" => "ccagent"
    end
    resource("tcode").stage { bin.install Dir["*"].first => "tcode" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
    assert_predicate bin/"cagent", :executable?
    assert_predicate bin/"ccagent", :executable?
    assert_predicate bin/"tcode", :executable?
  end
end
