class Supergloo < Formula
  desc "The Service Mesh Orchestration Platform"
  homepage "https://supergloo.solo.io/"
  version "0.3.23"

  if OS.mac?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-darwin-amd64"
    sha256 "5f3ea42d6a50716a913383c6c806a9d05b9d3ef8639950f1f3eead8194bf1630"
  elsif OS.linux?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-linux-amd64"
    sha256 "d95b37b87e5e3b1b19569dc79e5f6d4cfeb0c4399538e808a4fe422380879d5f"
  end

  def install
    if OS.mac?
      File.rename "#{name}-cli-darwin-amd64", name
    elsif OS.linux?
      File.rename "#{name}-cli-linux-amd64", name
    end

    bin.install name

    # Install bash completion
    # output = Utils.popen_read("SHELL=bash #{bin}/#{name} completion bash")
    # (bash_completion/name.to_s).write output

    # Install zsh completion
    # output = Utils.popen_read("SHELL=zsh #{bin}/#{name} completion zsh")
    # (zsh_completion/"_#{name}").write output

    prefix.install_metafiles
  end
end
