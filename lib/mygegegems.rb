require "yaml"
require "gems"

require "mygegegems/version"

module Mygegegems
  class << self
    def update
      Client.new.update
    end
  end

  class Client
    def initialize(path=File.expand_path('~/.mygegegems.yaml'))
      @path = path
    end

    def update
      data[Date.today] = get
      save(data, @path)
    end

    def data
      @data ||= load(@path)
    end

    def get
      Gems.gems.map { |gem| { gem['name'] => gem['downloads'] } }
    end
    
    def load(path)
      YAML.load_file(path)
    rescue Errno::ENOENT
      {}
    end
    
    def save(obj, path)
      File.open(path, 'w') { |f| YAML.dump(obj, f) }
    end
  end
end
