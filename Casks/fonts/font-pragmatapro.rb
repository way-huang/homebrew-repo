cask 'font-pragmatapro' do
  version "0.903"
  version_without_dot = version.gsub(".", "")
  sha256 :no_check

  url "ssh://git@github.com/way-huang/fonts.git",
    using: :git,
    branch: "master",
    only_path: "PragmataPro/Release #{version_without_dot}"

  name "PragmataPro"
  homepage "https://fsd.it/shop/fonts/pragmatapro/"

  font "PragmataProB_#{version_without_dot}.ttf"
  font "PragmataProB_liga_#{version_without_dot}.ttf"
  font "PragmataProI_#{version_without_dot}.ttf"
  font "PragmataProI_liga_#{version_without_dot}.ttf"
  font "PragmataProR_#{version_without_dot}.ttf"
  font "PragmataProR_liga_#{version_without_dot}.ttf"
  font "PragmataProZ_#{version_without_dot}.ttf"
  font "PragmataProZ_liga_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_B_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_B_liga_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_I_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_I_liga_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_R_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_R_liga_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_Z_#{version_without_dot}.ttf"
  font "PragmataPro_Mono_Z_liga_#{version_without_dot}.ttf"
end
