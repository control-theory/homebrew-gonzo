class Gonzo < Formula
  desc "Go-based TUI for real-time log analysis"
  homepage "https://github.com/control-theory/gonzo"
  url "https://github.com/control-theory/gonzo/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"
  head "https://github.com/control-theory/gonzo.git", branch: "main"

  depends_on "go" => :build

  def install
    # Honor Homebrew's build env (CGO flags, etc.)
    system "make", "build"
    bin.install "build/gonzo"
    # Optional: shell completions if you add a `completion` target later
    # bash_completion.install "build/completions/gonzo.bash" => "gonzo"
  end

  test do
    # The CLI exposes a --version/-v flag
    assert_match version.to_s, shell_output("#{bin}/gonzo --version")
  end
end