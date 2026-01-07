# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.5.6"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.6/MyAgentive-v0.5.6-macos.tar.gz"
    sha256 "3a7114d66c82e091017b606d8567c060e6ea8f5c3cfd6b93da26b169e6cd2096"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.6/MyAgentive-v0.5.6-linux-x64.tar.gz"
    sha256 "328fcdd17d135dadcf055a822a69b65344efbdbc11d410b449c914c4df0568a9"
  end

  def install
    # Install binaries
    bin.install "myagentive"
    bin.install "myagentivectl"

    # Install web dist files
    (share/"myagentive/dist").install Dir["dist/*"]

    # Install skills
    (share/"myagentive/skills").install Dir["skills/*"]
  end

  def caveats
    <<~EOS
      To start MyAgentive, run:
        myagentive

      On first run, an interactive setup wizard will guide you through
      configuring your Telegram bot and web interface password.

      Configuration is saved to: ~/.myagentive/config

      For background operation:
        myagentivectl start
        myagentivectl stop
        myagentivectl logs

      Documentation: https://github.com/AgentiveIS/MyAgentive
    EOS
  end

  test do
    assert_predicate bin/"myagentive", :executable?
  end
end
