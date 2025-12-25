# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.4.4"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.4/MyAgentive-v0.4.4-macos.tar.gz"
    sha256 "e702671be1a6af86b1266f97148b28faf4456c6ef3ebd596670c256c471c5193"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.4/MyAgentive-v0.4.4-linux-x64.tar.gz"
    sha256 "c9cf885b5cbb1f9b83a0a5b62b5fa92a3cbf0059d725514f6c7ee959d301f9b8"
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
