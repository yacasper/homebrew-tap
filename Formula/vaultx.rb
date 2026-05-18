class Vaultx < Formula
  desc "Cross-platform file encryption utility — AES-256-GCM / ChaCha20-Poly1305 + Argon2id"
  homepage "https://github.com/yacasper/vaultx"
  url "https://github.com/yacasper/vaultx/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "f10ca2fcd9d1ccee2772a703fa88761ba0934499f018597ac31c5bc912f84bdf"
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
