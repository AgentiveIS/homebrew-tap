# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.5.1"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.1/MyAgentive-v0.5.1-macos.tar.gz"
    sha256 "636fc5738ff5dd50669d542d661f62b332507008507ab75347d257be04d269af"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.5.1/MyAgentive-v0.5.1-linux-x64.tar.gz"
    sha256 "2ff756b26bd7094e59752323e143c60513f9e03fb4331a01b695aea366f26265"
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
