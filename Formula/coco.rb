class Coco < Formula
  desc ""
  homepage ""
  version "0.116.6"

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
      sha256 "1a09a8cb16eb5c765de7f8bcf1c6fe0648cadb81d0e0abb018697738a2031712"
    end

    on_arm do
      url "#{base_url}/coco_#{version}_darwin_arm64.tar.gz"
      sha256 "5d08620db30c9788b74319630b0641d1c660047fb1839b3f3448a1821b369e29"
    end
  end

  def install
    bin.install "coco" => "coco"
    bash_completion.install "completion.bash" => "coco"
    fish_completion.install "completion.fish" => "coco.fish"
    zsh_completion.install "completion.zsh" => "_coco"
  end
end
