class Coco < Formula
  desc ""
  homepage ""
  version "0.118.2"

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
      sha256 "36022f1fa225ee1357d03ebb3bb396da968f1fd72cdf85c7c4268d711f7a0240"
    end

    on_arm do
      url "#{base_url}/coco_#{version}_darwin_arm64.tar.gz"
      sha256 "e148393983c8c2abf74962b97dc5cc52f1fc1e298b6fc28a2970da59f45f0362"
    end
  end

  def install
    bin.install "coco" => "coco"
    bash_completion.install "completion.bash" => "coco"
    fish_completion.install "completion.fish" => "coco.fish"
    zsh_completion.install "completion.zsh" => "_coco"
  end
end
