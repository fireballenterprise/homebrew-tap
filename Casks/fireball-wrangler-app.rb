# Fireball Wrangler, the Mac app (fireball_wrangler#894). Copied as-is into fireballenterprise/homebrew-tap
# Casks/fireball-wrangler-app.rb by `invoke wrangler.tui.formula --tap <clone>`.
# The app updates itself with Sparkle (auto_updates), so the cask follows the stable download name rather than a version:
# https://downloads.fireballenterprise.com/wrangler/FireballWrangler.dmg always holds the current release's `Fireball Wrangler.app`.
cask "fireball-wrangler-app" do
  version :latest
  sha256 :no_check

  url "https://downloads.fireballenterprise.com/wrangler/FireballWrangler.dmg"
  name "Fireball Wrangler"
  desc "Round up your AI workforce: run and steer AI coding agents"
  homepage "https://fireballwrangler.com"

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Fireball Wrangler.app"

  # ~/.fireball_wrangler (agents, accounts) stays: the fireball-wrangler formula's host shares it.
  zap trash: [
    "~/Library/Caches/com.fireballenterprise.wrangler.mac",
    "~/Library/HTTPStorages/com.fireballenterprise.wrangler.mac",
    "~/Library/Preferences/com.fireballenterprise.wrangler.mac.plist",
  ]
end
