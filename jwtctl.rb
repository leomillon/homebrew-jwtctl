class Jwtctl < Formula
  desc "JWT Generator/Reader CLI"
  homepage "https://github.com/leomillon/jwtctl"
  url "https://github.com/leomillon/jwtctl/releases/download/1.0.0-BETA2/jwtctl-1.0.0-BETA2.zip"
  sha256 "f1a4b02b7233a1d30925fa6fab375873aebec33620e8a129666abf80ca6ca444"
  head "https://github.com/leomillon/jwtctl.git"
  
  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/jwtctl" => "jwtctl"
  end
  
  test do
    system bin/"jwtctl", "create", "--claim", "user", "BREW_INSTALLER_TEST"
  end
end
