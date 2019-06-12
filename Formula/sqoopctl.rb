class Sqoopctl < Formula
  desc "The GraphQL Engine powered by Gloo"
  homepage "https://sqoop.solo.io/"
  version "0.2.7"

  if OS.mac?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-darwin-amd64"
    sha256 "56a8be75b058ea9d5cfda6262713c3747b0ad006115bee8d08a3a2e168313ef3"
  elsif OS.linux?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-linux-amd64"
    sha256 "a4235b626631757dafde1ab490cf7a5fa02e1156a92952cedaa86454ed1b60c9"
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
