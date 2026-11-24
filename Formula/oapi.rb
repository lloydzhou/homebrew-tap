class Oapi < Formula
  desc "Standalone OpenAPI command-line client: call APIs from cached specs"
  homepage "https://github.com/lloydzhou/oapi"
  url "https://github.com/lloydzhou/oapi/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "d88ee6734c9c9f153665dba42daf06b337efec455399f243727ded15d71e3751"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.5/oapi-darwin-arm64"
      sha256 "8c121270acaca6f51551973ca78f5836637f2be4a821420e4e2d1801a7d5256d"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.5/oapi-darwin-amd64"
      sha256 "51c7362baacc8ba407fdc5724af6f57d2d896cb46c84889498c94f3157df4b84"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.5/oapi-linux-arm64"
      sha256 "d931f87e265d355825b9c1ed433c5ee881fe1b2d3630c6bad02ed0aa9343b01c"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.5/oapi-linux-amd64"
      sha256 "65ae2144220d9dbface95d6988e938e7560f3d639fa40cc78dbdd1312f9c3703"
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
