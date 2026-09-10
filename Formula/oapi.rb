class Oapi < Formula
  desc "Standalone OpenAPI command-line client: call APIs from cached specs"
  homepage "https://github.com/lloydzhou/oapi"
  url "https://github.com/lloydzhou/oapi/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "861f97a7fd662d305ce6b5fe51090fc3b1be666516e0ff03cd7c964cc7eff4ed"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.0/oapi-darwin-arm64"
      sha256 "8bb6e53180cd7cd6913eca1b9090a6e5cb49b84004cd07cdb5cffdc2176493bf"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.0/oapi-darwin-amd64"
      sha256 "0a5342966633187845061165f3051e81f64fd936f642cf5c0b7cc63c948ce2b4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.0/oapi-linux-arm64"
      sha256 "766fcb57cbcd98c6041ad5b0d217de2fda08828375db752cc45366663efa0b51"
    end
    on_intel do
      url "https://github.com/lloydzhou/oapi/releases/download/v0.1.0/oapi-linux-amd64"
      sha256 "7860f1a6c177c73b21d18d1f94d27dfecca84f3685ec118f0713a3b4cf9bca2a"
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
