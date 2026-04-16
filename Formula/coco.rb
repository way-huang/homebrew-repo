class Coco < Formula
  desc ""
  homepage ""
  version "0.120.20"

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
      sha256 "8ba3884b06dc35aabdb5209f2c85e4cd546eec583655a96b459e115ecdfdff99"
    end

    on_arm do
      url "#{base_url}/coco_#{version}_darwin_arm64.tar.gz"
      sha256 "491ebb0fc9596d729265d0338617e06b6595c159609b572cbceb9b17f70a4b82"
    end
  end

  def install
    bin.install "coco" => "coco"
    bash_completion.install "completion.bash" => "coco"
    fish_completion.install "completion.fish" => "coco.fish"
    zsh_completion.install "completion.zsh" => "_coco"
  end
end
