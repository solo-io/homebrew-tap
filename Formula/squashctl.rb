class Squashctl < Formula
  desc "The debugger for microservices"
  homepage "https://squash.solo.io/"
  version "0.5.17"

  if OS.mac?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-darwin"
    sha256 "2df2335c0f935e86275569889d75f73a1309f746d790a8de04d28c05af35c4e8"
  elsif OS.linux?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-linux"
    sha256 "e68f25b1613eb6038b2725e247584426f6d40c634eb36f0bbacf737c0ce4ca24"
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
