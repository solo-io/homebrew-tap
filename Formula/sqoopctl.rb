class Sqoopctl < Formula
  desc "The GraphQL Engine powered by Gloo"
  homepage "https://sqoop.solo.io/"
  version "0.2.6"

  if OS.mac?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-darwin-amd64"
    sha256 "1fe412f50d475020a31f405813a9521e6fdb571109955bf771a3caac591a0f51"
  elsif OS.linux?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-linux-amd64"
    sha256 "86de980668888c22e8373f2bbc7b844464ffa1506d44f42b123639ce5f266ff9"
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
