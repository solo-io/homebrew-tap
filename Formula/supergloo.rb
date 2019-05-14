class Supergloo < Formula
  desc "The Service Mesh Orchestration Platform"
  homepage "https://supergloo.solo.io/"
  version "0.3.20"

  if OS.mac?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-darwin-amd64"
    sha256 "b8ef1675d488b9bc51eb804b7f9ca624be4a504e28d1a31b12632e8727712278"
  elsif OS.linux?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-linux-amd64"
    sha256 "092f7115d29c6c69d4fc541f2f6e7ad2f75f77950bfdf74488c85503e45835ad"
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
