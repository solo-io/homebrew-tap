class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.18.29"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "2f468f1629e9a816e93d593a6bef865b78a92e7e942995eb841151929557b71b"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "6f2bf2a24b7be28bcb167ca90fd60da4a1bbd90748d707ee8a46bc8a58256328"
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
