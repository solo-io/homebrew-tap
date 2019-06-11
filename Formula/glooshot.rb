class Glooshot < Formula
  desc "Chaos engineering framework to help you Immunize your service mesh"
  homepage "https://glooshot.solo.io"
  version "0.0.5"

  if OS.mac?
    url "https://github.com/solo-io/glooshot/releases/download/v#{version}/glooshot-darwin-amd64"
    sha256 "1b13c5a559ad9395c93d23e7f6f734cdf4a9b6d468b20eeb8209fa171ef51569"
  elsif OS.linux?
    url "https://github.com/solo-io/glooshot/releases/download/v#{version}/glooshot-linux-amd64"
    sha256 "92d943e63910742e326e62f053d39b50ae250da124d522a0dec701ca6074503e"
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
