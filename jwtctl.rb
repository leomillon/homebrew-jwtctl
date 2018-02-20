class Jwtctl < Formula
  desc "JWT Generator/Reader CLI"
  homepage "https://github.com/leomillon/jwtctl"
  url "https://github.com/leomillon/jwtctl/releases/download/1.0.0-BETA_1/jwtctl-1.0.0-BETA_1.zip"
  sha256 "3652a5d1fb3e97a87feedf83a4d08b858e3752a9a81267556e14c739010d9e9a"
  head "https://github.com/leomillon/jwtctl.git"
  
  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/jwtctl" => "jwtctl"
  end
  
  test do
    system bin/"jwtctl", "create", "--claim", "user", "BREW_INSTALLER_TEST"
  end
end
