class BashAgent < Formula
  desc "A lightweight coding agent that runs in your terminal"
  homepage "https://github.com/lloydzhou/bash-agent"
  url "https://github.com/lloydzhou/bash-agent/archive/refs/tags/v3.0.4.tar.gz"
  sha256 "18d40cfb6379108e72133b48c35cdef221d9ee699b2a0ded67372d79a9b3c1d5"
  license "MIT"

  depends_on "bash" => :run
  depends_on "gawk" => :run

  resource "goagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-darwin-arm64"
        sha256 "64994936fc015bee34aa463ccee2ddc1a44fec45c961fa9d04058554e836f3cb"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-darwin-amd64"
        sha256 "afa1139d3895469edbedca3b65cb614ff22dfadbb568b2047ad23df7523eb5f2"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-linux-arm64"
        sha256 "1ab8d606c6f185f97e98d570ffea2ed822fee74518079a0d6b1fcabc96558627"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/goagent-linux-amd64"
        sha256 "8775b77d330d2b5335788c8a67788501f290da194cc72fcf42b14cd50b6fdf9f"
      end
    end
  end

  resource "rustagent" do
    on_macos do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-darwin-arm64"
        sha256 "5bbe9ab14e1509aeaf3d1c29a4dc31f358a546fb450a7b292f2677d2f43eafb6"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-darwin-amd64"
        sha256 "7c2f7424b674ac6930ad20a4d8cee4acaafd0eb17c1a7eb6ae72b6307b6d54bf"
      end
    end
    on_linux do
      on_arm do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-linux-arm64"
        sha256 "8f5e1810dbf6a01a63d3edfd1478c5322beb560ee9f4d375436ba818c26a49d5"
      end
      on_intel do
        url "https://github.com/lloydzhou/bash-agent/releases/download/v3.0.4/rustagent-linux-amd64"
        sha256 "1e1fb1723dc3c6b59281c629dba057a378aa10f9d4d8d233a5cd3a98ac3f8d6a"
      end
    end
  end

  def install
    # Build bash agent from source (fast, no compilation deps)
    system "bash", "scripts/build.sh", "dist/agent.sh"
    bin.install "dist/agent.sh" => "bash-agent"

    # Install pre-compiled goagent and rustagent
    resource("goagent").stage { bin.install Dir["*"].first => "goagent" }
    resource("rustagent").stage { bin.install Dir["*"].first => "rustagent" }

    doc.install "README.md"
    doc.install "CHANGELOG.md"
  end

  test do
    assert_predicate bin/"bash-agent", :executable?
    assert_predicate bin/"goagent", :executable?
    assert_predicate bin/"rustagent", :executable?
  end
end
