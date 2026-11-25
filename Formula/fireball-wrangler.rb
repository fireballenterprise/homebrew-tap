# Fireball Wrangler terminal UI + headless host (fireball_wrangler#894).
# Rendered by `invoke wrangler.tui.formula` (fireball_orchestrator modules/wrangler/tui.py) into the family tap,
# fireballenterprise/homebrew-tap Formula/fireball-wrangler.rb. Do not edit the rendered copy by hand.
# The tarballs come from the public downloads host (never GitHub release assets: the tap and the app repo are private).
class FireballWrangler < Formula
  desc "Run and steer your AI coding agents from the terminal"
  homepage "https://fireballwrangler.com"
  version "3.6.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://fireballwrangler.com/downloads/tui/fireball-wrangler-3.6.0-macos-arm64.tar.gz"
      sha256 "5f16a4a17aa2b348f80c872fed8dca3ff4fa2257499ee560819951dd77a9c702"
    end
    on_intel do
      url "https://fireballwrangler.com/downloads/tui/fireball-wrangler-3.6.0-macos-x86_64.tar.gz"
      sha256 "58ec7e192f94e02969685d080d94faba22b67c3bc970a9cd49e51cbc6f94311f"
    end
  end

  on_linux do
    on_arm do
      url "https://fireballwrangler.com/downloads/tui/fireball-wrangler-3.6.0-linux-arm64.tar.gz"
      sha256 "25e85972f9c4030c49db8eb671ea24564a557b9601254bd1a919d8a001de1ee2"
    end
    on_intel do
      url "https://fireballwrangler.com/downloads/tui/fireball-wrangler-3.6.0-linux-x86_64.tar.gz"
      sha256 "29e39287ad77956a0d7081cdf6dea954ae13a89d2251c97d82adc812f85440f7"
    end
  end

  def install
    bin.install "fireball-wrangler"
    # Called as `wrangler`, the binary opens the terminal UI.
    bin.install_symlink "fireball-wrangler" => "wrangler"
  end

  # `brew services start fireball-wrangler`: the headless host at login.
  service do
    run [opt_bin/"fireball-wrangler", "serve"]
    keep_alive true
    log_path var/"log/fireball-wrangler.log"
    error_log_path var/"log/fireball-wrangler.log"
  end

  def caveats
    <<~EOS
      Open the terminal UI with:
        wrangler
      Run the host in the background at login with:
        brew services start fireball-wrangler
      Don't start the service on a Mac that runs the Fireball Wrangler app: the app runs its own host.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fireball-wrangler --version")
  end
end
