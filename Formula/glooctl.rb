class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.20.10"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "609332991b9cb42847d6c1d213ed5bf70fdf9f4d0d796917d0877773baab3897"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "44c2b0f857e321e7ef84f712ea30c6a85415a33e357a3f03395cdcfbff2142bd"
  end

  def install
    if OS.mac?
      File.rename "#{name}-darwin-amd64", name
    elsif OS.linux?
      File.rename "#{name}-linux-amd64", name
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
