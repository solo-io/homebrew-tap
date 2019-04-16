class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.13.14"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "5b741927c40f4a430bcf42905901e204e955a5a5a3a3bbb9e67680df3a188f99"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "9e173748ca85c5505909c4c7abe0cb03a58aef3b56dc134ece62d2306433347f"
  else
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-windows-amd64.exe"
    sha256 "031434d831a394af2b7882b6f1a220e34efc91c4e4ef807a530fc8ec7990d2ca"
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
