class Coco < Formula
  desc ""
  homepage ""
  version "0.120.21"

  # Read base URL from config file or environment variable
  def self.base_url
    config_file = File.expand_path("~/.local/share/coco/config")
    if File.exist?(config_file)
      File.read(config_file).strip
    elsif ENV["COCO_BASE_URL"]
      ENV["COCO_BASE_URL"]
    else
      raise "COCO_BASE_URL is not set. Please set it via environment variable or create ~/.coco-config file."
    end
  end

  on_macos do
    on_intel do
      url "#{base_url}/coco_#{version}_darwin_amd64.tar.gz"
      sha256 "8805e4f51a4a3c3ca6aa8ec8a3f9034ee47f2b343573279affbc36c855efca6c"
    end

    on_arm do
      url "#{base_url}/coco_#{version}_darwin_arm64.tar.gz"
      sha256 "61ae8008caef0bf4fdfd5b1d2386eb8dde2a724add00e2f74b3fa0dd24dda9a3"
    end
  end

  def install
    bin.install "coco" => "coco"
    bash_completion.install "completion.bash" => "coco"
    fish_completion.install "completion.fish" => "coco.fish"
    zsh_completion.install "completion.zsh" => "_coco"
  end
end
