class Sqoopctl < Formula
  desc "The GraphQL Engine powered by Gloo"
  homepage "https://sqoop.solo.io/"
  version "0.2.4"

  if OS.mac?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-darwin-amd64"
    sha256 "4989f1d68c2dd7da1895ab3361fce698ddd12fe0e4ef342ee04458d7d36d5ffe"
  elsif OS.linux?
    url "https://github.com/solo-io/sqoop/releases/download/v#{version}/sqoopctl-linux-amd64"
    sha256 "2a23fbaf4281c40e2aa723da7d9b6446bb05e55f8fd0c216618378cf4e451691"
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
