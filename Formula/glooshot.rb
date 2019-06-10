class Glooshot < Formula
  desc "Chaos engineering framework to help you Immunize your service mesh"
  homepage "https://glooshot.solo.io"
  version "0.0.4"

  if OS.mac?
    url "https://github.com/solo-io/glooshot/releases/download/v#{version}/glooshot-darwin-amd64"
    sha256 "fa76b87559ac9cefa342e9e9fc80d9a47b872ee2ecce8b36efefb9a76916c14f"
  elsif OS.linux?
    url "https://github.com/solo-io/glooshot/releases/download/v#{version}/glooshot-linux-amd64"
    sha256 "b19dc3ee13f9113617253cd0bd9482be096ca8d7ad85b22806be6481389e9ab1"
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
