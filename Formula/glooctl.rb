class Glooctl < Formula
  desc "Envoy-Powered API Gateway"
  homepage "https://gloo.solo.io"
  version "0.13.23"

  if OS.mac?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-darwin-amd64"
    sha256 "d29bae37b3e36fe1a81fda1b556395dc4b95c1168f47c7494db85e2980668d51"
  elsif OS.linux?
    url "https://github.com/solo-io/gloo/releases/download/v#{version}/glooctl-linux-amd64"
    sha256 "4ef67211be0b942661f36f87297c66407082f9e9e6a4b13d6c25dc170a6156f3"
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
