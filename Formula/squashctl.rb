class Squashctl < Formula
  desc "The debugger for microservices"
  homepage "https://squash.solo.io/"
  version "0.5.18"

  if OS.mac?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-darwin"
    sha256 "5d2f33a406398d0c9b2430a9ce93ba34e4b3042c914cbdcf54603185d02a90f1"
  elsif OS.linux?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-linux"
    sha256 "071406a1eadcf78014c1b6c629c46e3145a1f150d40555a4be0410747160b82b"
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
