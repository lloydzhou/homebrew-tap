class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v4.0.6.tar.gz"
  sha256 "6fee8d6538d50a5fb86d7feea64dc03acf29fa1278bbf2e4976bdf313eddc1e1"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "agent" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/agent.sh"
    sha256 "7b0ff7af87e8ca148e7266a336d36e192ca3049b0487fa98f05304fc70a41bda"
  end

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-darwin-arm64"
        sha256 "81000dc6fef4e9e7ca8ad7e4333371c6087c3255f9fe2d86c844a1d507defc00"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-darwin-amd64"
        sha256 "5b222ec801225d40ef6a34e40220dadc3d9e34ad9339d6d9692959888af05036"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-linux-arm64"
        sha256 "6b381a316562f54ec1b3d09977ddbad8b6284aff02914b6129c71db98fe0db15"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/goagent-linux-amd64"
        sha256 "15f54de6785b210a7890aad5a0540a7a7768d7421f56c53671d7ca8331f7ee9f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-darwin-arm64"
        sha256 "39618b4257bf394b223bc087f7b9e3561150af51b277cdfbb5abc51acf2b03fb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-darwin-amd64"
        sha256 "c1c0aa7ee0e94924bf2698c24e4ff80f49701eb0e853f590e082bacfbb131ab5"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-linux-arm64"
        sha256 "6a462bcca7d5eb449a34ba633ce6ee70b84ee0c8b3345d539edc63b2e59480e4"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/rustagent-linux-amd64"
        sha256 "7b58362800b4a67d2e25081501dbd0d6446497a110418a84d68de2cfa94c840b"
      end
    end
  end

  resource "cagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-darwin-arm64"
        sha256 "bdbdfadd83ef159aa6f1183ed1df23f06656b58806e65874603e0a94b9935139"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-darwin-amd64"
        sha256 "e418c1cde054edf9d2696e58fec4f63e0ed29bc5ceea06dca2f13fd2e3f28867"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-linux-arm64"
        sha256 "3d9ff96cedd00385f0761df154ad80c07f599f16d349b9f9f2cff1cf84fafcb9"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/cagent-linux-amd64"
        sha256 "0fdb7ce7f04106fdcdf11640de6b8f5f9f2a180f32e289701707a8ede9f79ee8"
      end
    end
  end

  resource "tcode" do
    url "https://github.com/lloydzhou/bash-agent/releases/download/v4.0.6/tcode"
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
