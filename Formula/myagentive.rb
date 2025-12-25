# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.4.3"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.3/MyAgentive-v0.4.3-macos.tar.gz"
    sha256 "548fdf6a56067d7bb5db1d5d4258e7e77e08de822ee614cd96c16abdb842f109"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.3/MyAgentive-v0.4.3-linux-x64.tar.gz"
    sha256 "4517a3389da902a7bbfcb752f99a51f02c7ef697bc6e1aed05f03fc6dd76cada"
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
