class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.13.12"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "b872beb2658e99912fd7825e51f37cc15c7c7a20c2c6b1a4a61860ddb9fcdb17"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "8dad04591ddd227f1d307b5c5f737bcdda8c5f24060730d19a739dc11fa146f3"
  else
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-windows-amd64.exe"
    sha256 "6a7eb0c28434474b7627494ddcf6575fd01f5f780f2f83e9f0face22dfe43ee9"
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
