# SPDX-License-Identifier: Apache-2.0
class Tensorplate < Formula
  desc "Operator CLI for TensorPlate edge inference devices"
  homepage "https://github.com/tensorplate/tensorplate"
  url "https://github.com/tensorplate/tensorplate/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "07f5c57d4c1b7cee5a9ed0d8813644257181af1ab6c7456ca18d8cca6368b26e"
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
