require "yaml"
require "gems"

require "mygegegems/version"
require "mygegegems/client"
require "mygegegems/stat"
require "mygegegems/cli"

module Mygegegems
  DATA_PATH = File.expand_path('~/.mygegegems.yaml')

  class << self
    def update
      Client.new.update
    end

    def gems(user)
      Client.new.gems(user)
    end
  end
end
