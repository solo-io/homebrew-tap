class Squashctl < Formula
  desc "The debugger for microservices"
  homepage "https://squash.solo.io/"
  version "0.5.8"

  if OS.mac?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-darwin"
    sha256 "d79bbdbf5faa7e37a21ed6cb277af4d41b9cd6dcb8980313c3b95dcdc97cee60"
  elsif OS.linux?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-linux"
    sha256 "4ba56ebbb074f3b96fabde92dd51319822b142353cac7fd5899de302b1cf0e8c"
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
