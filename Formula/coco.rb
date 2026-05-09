class Coco < Formula
  desc ""
  homepage ""
  version "0.120.31"

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
      sha256 "64a5ee137f92a9ee841b01d89c68939a71aec210e80f909977d5f1c9c26b2c95"
    end

    on_arm do
      url "#{base_url}/coco_#{version}_darwin_arm64.tar.gz"
      sha256 "eb703d806dfd970a212efd492018e1031b38f99d5c70ed6abcb51a36295ae596"
    end
  end

  def install
    bin.install "coco" => "coco"
    bash_completion.install "completion.bash" => "coco"
    fish_completion.install "completion.fish" => "coco.fish"
    zsh_completion.install "completion.zsh" => "_coco"
  end
end
