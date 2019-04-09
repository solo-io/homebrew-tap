class Supergloo < Formula
  desc "The Service Mesh Orchestration Platform"
  homepage "https://supergloo.solo.io/"
  version "0.3.7"

  if OS.mac?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-darwin-amd64"
    sha256 "4578c245fe503aac8664d17fe147a6bb94008cdbfbf0aac82fa0000960017cfd"
  elsif OS.linux?
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-linux-amd64"
    sha256 "9280e5c61849c12a96f8bf7b601ef7fd15a5e3d5f06093727263acec8acbca31"
  else
    url "https://github.com/solo-io/supergloo/releases/download/v#{version}/supergloo-cli-windows-amd64.exe"
    sha256 "6d4ee44345231421b65d8bfafe71844802f825ffb9e516aff7306fb3523d1705"
  end

  def install
    if OS.mac?
      File.rename "#{name}-cli-darwin-amd64", name
    elsif OS.linux?
      File.rename "#{name}-cli-linux-amd64", name
    else
      File.rename "#{name}-cli-windows-amd64.exe", name
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
