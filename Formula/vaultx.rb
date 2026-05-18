class Vaultx < Formula
  desc "Cross-platform file encryption utility — AES-256-GCM / ChaCha20-Poly1305 + Argon2id"
  homepage "https://github.com/yacasper/vaultx"
  url "https://github.com/yacasper/vaultx/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "6a3159a0ff9b3f3eb51a5e043b75b591741e03c52ba1d47348613dabddcd0c93"
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
