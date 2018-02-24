class Jwtctl < Formula
  desc "JWT Generator/Reader CLI"
  homepage "https://github.com/leomillon/jwtctl"
  url "https://github.com/leomillon/jwtctl/releases/download/1.0.0/jwtctl-1.0.0.zip"
  sha256 "6e7ea394fb6693a3e281032e6e0ed6f0fcee0c3527c11f8cde0b3879e550d030"
  head "https://github.com/leomillon/jwtctl.git"

  depends_on "bash-completion" => :recommended

  def install
    libexec.install "bin"
    libexec.install "lib"
    bin.install_symlink "#{libexec}/bin/jwtctl" => "jwtctl"

    bash_completion.install "completion/jwtctl-completion.bash"
  end

  def caveats; <<~EOS
    To use completion, add the following line to your ~/.bash_profile or ~/.zshrc:
      [ -f #{etc}/bash_completion.d/jwtctl-completion.bash ] && source #{etc}/bash_completion.d/jwtctl-completion.bash

    /!\\ ZSH users : you may need to add these two lines before the previous one
      autoload -U compinit && compinit
      autoload -U bashcompinit && bashcompinit
    EOS
  end

  test do
    system bin/"jwtctl", "create", "--claim", "user", "BREW_INSTALLER_TEST"
  end
end
