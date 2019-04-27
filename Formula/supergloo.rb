class Supergloo < Formula
  desc "The Service Mesh Orchestration Platform"
  homepage "https://supergloo.solo.io/"
  version "0.3.15"

  if OS.mac?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-darwin-amd64"
    sha256 "71e67040ef3be2d9bbc6cca766c7c899fa5c9d5089aca4f3cdc23e548baf4a51"
  elsif OS.linux?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-linux-amd64"
    sha256 "43757bc66823f239b9648f399928af6cc6833e8a39da100ff2b169f47cca5c26"
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
