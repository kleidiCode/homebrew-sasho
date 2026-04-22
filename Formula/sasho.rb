class Sasho < Formula
  desc "Native macOS window manager with keyboard shortcuts and trackpad gestures"
  homepage "https://github.com/kleidiCode/sasho"
  url "https://github.com/kleidiCode/sasho/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7dc688c9a2971613f1cd2831446454434102ee3bd67e01f35b180f3a18c8f3cd"
  license "Apache-2.0"
  version "0.1.0"

  depends_on :macos

  def install
    system "swiftc", "-O",
           "-framework", "Cocoa",
           "-framework", "Carbon",
           "-framework", "ApplicationServices",
           *Dir["Sources/Sasho/**/*.swift"],
           "-o", "sasho"
    bin.install "sasho"
  end

  def caveats
    <<~EOS
      Sasho requires Accessibility permissions to manage windows.

      On first launch, grant access in:
        System Settings → Privacy & Security → Accessibility

      To start sasho now and on login:
        sasho &
    EOS
  end

  test do
    assert_match "sasho", shell_output("#{bin}/sasho --version")
  end
end
