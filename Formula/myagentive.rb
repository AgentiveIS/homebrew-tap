# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.5.8"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.8/MyAgentive-v0.5.8-macos.tar.gz"
    sha256 "c45bc880d509853ec5fe4de2da0eb8f65ba6d0829646b629049556d1df04a890"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.8/MyAgentive-v0.5.8-linux-x64.tar.gz"
    sha256 "a772263f22f92fd3897d52c7aab2b1d5fc8b1e4c42e37b5587dae346f8090a70"
  end

  def install
    # Install binaries
    bin.install "myagentive"
    bin.install "myagentivectl"

    # Install web dist files
    (share/"myagentive/dist").install Dir["dist/*"]

    # Install skills
    (share/"myagentive/skills").install Dir[".claude/skills/*"]
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
