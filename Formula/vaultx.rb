class Vaultx < Formula
  desc "Cross-platform file encryption utility — AES-256-GCM / ChaCha20-Poly1305 + Argon2id"
  homepage "https://github.com/yacasper/vaultx"
  url "https://github.com/yacasper/vaultx/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "f1ff6aa5ad6c88dce092a60caf74cbeeb95d1c0f73b7129adba76525e43ee2a1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build",
      "-ldflags", "-s -w -X main.version=#{version}",
      "-o", bin/"vaultx",
      "."
  end

  test do
    assert_match "vaultx #{version}", shell_output("#{bin}/vaultx version")
  end
end
