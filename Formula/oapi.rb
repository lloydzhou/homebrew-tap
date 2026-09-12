class Oapi < Formula
  desc "Standalone OpenAPI command-line client: call APIs from cached specs"
  homepage "https://github.com/lloydzhou/oapi"
  url "https://github.com/lloydzhou/oapi/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "70e09d82700d5b90b1c8bc5f70112ae8d17cfea94249e1ac2faf233e1b1b11cc"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.2/oapi-darwin-arm64"
      sha256 "af005df40998b9e3bb03a5f7124c4bf02c40b0e06e5040f7db9409ca8de9c11a"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.2/oapi-darwin-amd64"
      sha256 "cfa1b0932c02378bf37889347c2368446ddf6987054679edf3e1202678b39de1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.2/oapi-linux-arm64"
      sha256 "649d7788218594de9760049494ea2128a2235ecc0238b975d8bddb78e1159bb4"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.2/oapi-linux-amd64"
      sha256 "abbc1b235695cdb777cb9799e22761f7ca0bbdb4e6575e6f5ab4ed09c85c0015"
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
