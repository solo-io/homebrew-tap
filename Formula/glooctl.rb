class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.13.13"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "70e3a152f300e031719a53fa6f539ab5d5e8085a511e70451c195a59c5789f1a"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "9d254b250f4a6b9e05814b29141dabbd0d0af084bc175b86d954bd326d574358"
  else
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-windows-amd64.exe"
    sha256 "623b80693426104b8887c72257528ae0576ba5571cea4d34c9a2b5dab6947c34"
  end

  def install
    if OS.mac?
      File.rename "#{name}-darwin-amd64", name
    elsif OS.linux?
      File.rename "#{name}-linux-amd64", name
    else
      File.rename "#{name}-windows-amd64.exe", name
    end

    bin.install name

    # Install bash completion
    output = Utils.popen_read("SHELL=bash #{bin}/#{name} completion bash")
    (bash_completion/name.to_s).write output

    # Install zsh completion
    output = Utils.popen_read("SHELL=zsh #{bin}/#{name} completion zsh")
    (zsh_completion/"_#{name}").write output

    prefix.install_metafiles
  end
end
