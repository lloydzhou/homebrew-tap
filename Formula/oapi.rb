class Oapi < Formula
  desc "Standalone OpenAPI command-line client: call APIs from cached specs"
  homepage "https://github.com/lloydzhou/oapi"
  url "https://github.com/lloydzhou/oapi/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "571b08ec26bc3acbbb647bb9000d7b2e1b8a1fa8bf53821ae62b9f4d87d9ce66"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.4/oapi-darwin-arm64"
      sha256 "dae503adc4082697e63274efc98f340f8ba4efc7846c13b0030b54eef3f29215"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.4/oapi-darwin-amd64"
      sha256 "acd8cb1bd1d612302e327f2297dca23cbc3a670ee117a86c9647dd3a197e2267"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.4/oapi-linux-arm64"
      sha256 "17b8f74df314f45999780242a7a59a93ac99d9bf2742845b9389f8bebdb7f5bf"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.4/oapi-linux-amd64"
      sha256 "462993e292b034ff5107fb69fae490b6fe6f0f40b708efa13188aa11c294df8b"
    end
  end

  def install
    bin.install Dir["*"].first => "oapi"
  end

  test do
    assert_predicate bin/"oapi", :executable?
    assert_match "usage: oapi connect", shell_output("#{bin}/oapi 2>&1", 1)
  end
end
