# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.4.1"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.1/MyAgentive-v0.4.1-macos.tar.gz"
    sha256 "90577fff7c8f289971245b77f4d8195c2951d28376ad1f95b150cf9343bde66b"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.1/MyAgentive-v0.4.1-linux-x64.tar.gz"
    sha256 "920725edd1309ac7e8b34f737806f0695b80af2990a7b87d3eb42392d98de0af"
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
