# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.5.2"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.2/MyAgentive-v0.5.2-macos.tar.gz"
    sha256 "282c54b1b2a181a972e9385eb6fdb9d5cc972972107117ed9ece3b712f43b1a0"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.2/MyAgentive-v0.5.2-linux-x64.tar.gz"
    sha256 "7e2e86edc02a2c51d8f174595dea14df1ef1eb90f7a8dcb73a044622267c8a65"
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
