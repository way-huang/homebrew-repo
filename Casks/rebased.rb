cask "rebased" do
  version "1.0.7"
  sha256 "e0417f83d3638ce1922513be721dbcf73598b7ef383a06da43357619392cfd2f"

  on_arm do
    url "https://github.com/DetachHead/rebased/releases/download/#{version}/ideaIC-261.22158-aarch64.dmg"
  end

  name "Rebased"
  desc "An open-source remake of the short-lived jetbrains git client"
  homepage "https://github.com/DetachHead/rebased"

  app "Rebased.app"
end
