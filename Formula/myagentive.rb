# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.5.7"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.7/MyAgentive-v0.5.7-macos.tar.gz"
    sha256 "e069830fb7ac258cea9493de88458ca9ae187e62ef682cdb0a06c3c6a160197c"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.7/MyAgentive-v0.5.7-linux-x64.tar.gz"
    sha256 "a6a4074be034a54856b8437f9e93e46c64da75e9fb200f2352bd9b37d2d693c2"
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
