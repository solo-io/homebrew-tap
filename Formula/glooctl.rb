class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.18.9"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "d78516d82a27928d354a83149d35062f832788d4a7014c95726c9b28b9c4648e"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "e9989476018eacecc755bc77ac6c6cfd72eb55f523081ead0392eef1945fea7d"
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
