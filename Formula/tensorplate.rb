# SPDX-License-Identifier: Apache-2.0
class Tensorplate < Formula
  desc "Operator CLI for TensorPlate edge inference devices"
  homepage "https://github.com/tensorplate/tensorplate"
  url "https://github.com/tensorplate/tensorplate/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c3b5daea3f1424584ff7abf5a5c18509171c1bd7e5d13ac4c0f039834d16375e"
  license "Apache-2.0"
  head "https://github.com/tensorplate/tensorplate.git", branch: "develop"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  def caveats
    <<~EOS
      This installs only the TensorPlate operator CLI. The TensorPlate
      runtime (agent, serving worker, observability service) is
      Linux-only and is installed on Jetson devices via APT.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tensorplate version")
  end
end
