class Supergloo < Formula
  desc "The Service Mesh Orchestration Platform"
  homepage "https://supergloo.solo.io/"
  version "0.3.14"

  if OS.mac?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-darwin-amd64"
    sha256 "8a9fe36e51b0d2f713569b54acd994bf8cf3be88398b149dff81b01f9a3f6859"
  elsif OS.linux?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-linux-amd64"
    sha256 "6a007012fd80fab0146bd01be4897cae59a1404c694257a4c31866e6c95caccc"
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
