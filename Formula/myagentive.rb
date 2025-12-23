# typed: false
# frozen_string_literal: true

class Myagentive < Formula
  desc "Open-source personal AI agent for power users"
  homepage "https://myagentive.ai"
  version "0.4.0"
  license "Elastic-2.0"

  on_macos do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.0/MyAgentive-v0.4.0-macos.tar.gz"
    sha256 "047012b4a204e218809da5c130be0021dd7f85c6878953b3f2179e8a39445cbe"
  end

  on_linux do
    url "https://github.com/AgentiveIS/MyAgentive/releases/download/v0.4.0/MyAgentive-v0.4.0-linux-x64.tar.gz"
    sha256 "ab0cd7571e243034bb27485839ed32e91024365aa4dbce8e763420423a558abe"
  end

  def install
    # Install binary
    bin.install "myagentive"
    bin.install "myagentivectl"

    # Install web dist files
    (share/"myagentive/dist").install Dir["dist/*"]

    # Install skills
    (share/"myagentive/skills").install Dir["skills/*"]

    # Create data directories
    (var/"myagentive").mkpath
  end

  def post_install
    # Create user config directory if it doesn't exist
    user_config = "#{ENV["HOME"]}/.myagentive"
    system "mkdir", "-p", user_config unless Dir.exist?(user_config)
    system "mkdir", "-p", "#{user_config}/data" unless Dir.exist?("#{user_config}/data")
    system "mkdir", "-p", "#{user_config}/media" unless Dir.exist?("#{user_config}/media")

    # Link shared files to user directory
    unless Dir.exist?("#{user_config}/dist")
      system "ln", "-sf", "#{share}/myagentive/dist", "#{user_config}/dist"
    end
    unless Dir.exist?("#{user_config}/skills")
      system "ln", "-sf", "#{share}/myagentive/skills", "#{user_config}/skills"
    end
  end

  def caveats
    <<~EOS
      To start MyAgentive, run:
        myagentive

      Configuration is stored in ~/.myagentive/config

      For background operation:
        myagentivectl start
        myagentivectl stop
        myagentivectl logs

      Documentation: https://github.com/AgentiveIS/MyAgentive
    EOS
  end

  test do
    assert_match "MyAgentive", shell_output("#{bin}/myagentive --version 2>&1", 1)
  end
end
