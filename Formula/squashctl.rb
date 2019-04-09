class Squashctl < Formula
  desc "The debugger for microservices"
  homepage "https://squash.solo.io/"
  version "0.5.7"

  if OS.mac?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-darwin"
    sha256 "402485f7d8b7bb92ecf9a0c2e4319c062c8f9e02692828e166a5a0db537b983d"
  elsif OS.linux?
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-linux"
    sha256 "995670ddb80b74e8b18d1b803e4363264d67b6aa4c6d06d740f25a8a58adc8e1"
  else
    url "https://github.com/solo-io/squash/releases/download/v#{version}/squashctl-windows.exe"
    sha256 "198c8dc83395b4b569b5e20f6fcd92761bc079a1830e98e417453ce971dd388f"
  end

  def install
    if OS.mac?
      File.rename "#{name}-darwin", name
    elsif OS.linux?
      File.rename "#{name}-linux", name
    else
      File.rename "#{name}-windows.exe", name
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
