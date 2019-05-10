class Sqoopctl < Formula
  desc "The GraphQL Engine powered by Gloo"
  homepage "https://sqoop.solo.io/"
  version "0.2.5"

  if OS.mac?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-darwin-amd64"
    sha256 "7dc0949d2c3d45eccb8bb9876001592716a141338606ceace2a0a3b5bbbfd01a"
  elsif OS.linux?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-linux-amd64"
    sha256 "46639a28d233ffd15a85ec2b557bf6776de3ac1ced1930f3cb80bb49dcb6a949"
  end

  def install
    if OS.mac?
      File.rename "#{name}-darwin-amd64", name
    elsif OS.linux?
      File.rename "#{name}-linux-amd64", name
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
