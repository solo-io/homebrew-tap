class Squashctl < Formula
  desc "The debugger for microservices"
  homepage "https://squash.solo.io/"
  version "0.5.14"

  if OS.mac?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-darwin"
    sha256 "bbc4de963128b55f901d107d7798e461b8140195ffab291012cca2afd1d65c61"
  elsif OS.linux?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-linux"
    sha256 "abdcbb6aa9ed9e1d1495f87496654d4799de68409cd78292b4a2da1087b30973"
  end

  def install
    if OS.mac?
      File.rename "#{name}-darwin", name
    elsif OS.linux?
      File.rename "#{name}-linux", name
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
