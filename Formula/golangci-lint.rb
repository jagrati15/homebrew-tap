# This file was generated by GoReleaser. DO NOT EDIT.
class GolangciLint < Formula
  desc "Fast linters runner for Go."
  homepage "https://golangci.com"
  version "1.23.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/golangci/golangci-lint/releases/download/v1.23.2/golangci-lint-1.23.2-darwin-amd64.tar.gz"
    sha256 "c88f2fe24805bb3cf03832053ee5dbe8f6a60ed0a31d1fb2eef2d0910a9b7189"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/golangci/golangci-lint/releases/download/v1.23.2/golangci-lint-1.23.2-linux-amd64.tar.gz"
      sha256 "74f59f1f8516bc8a157543335c0b7a90071f8aa656219b8734a07362c048d8ab"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/golangci/golangci-lint/releases/download/v1.23.2/golangci-lint-1.23.2-linux-arm64.tar.gz"
        sha256 "d55bc44ca070cb1d88bd49be2cea2b3a6e396f9f5dba63589335e078b7ded1a7"
      else
        url "https://github.com/golangci/golangci-lint/releases/download/v1.23.2/golangci-lint-1.23.2-linux-armv6.tar.gz"
        sha256 "62f006dea37e1c335a3821a5ebf3592670857a5b101389c4dbe53fc1556856fe"
      end
    end
  end

  def install
    bin.install "golangci-lint"
    output = Utils.popen_read("#{bin}/golangci-lint completion bash")
    (bash_completion/"golangci-lint").write output
    output = Utils.popen_read("#{bin}/golangci-lint completion zsh")
    (zsh_completion/"_golangci-lint").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/golangci-lint --version"
  end
end
