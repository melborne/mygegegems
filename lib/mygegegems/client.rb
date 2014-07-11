module Mygegegems
  class Client
    def initialize(path=DATA_PATH)
      @path = path
    end

    def update
      data[Date.today] = get
      save(data, @path)
    end

    private
    def data
      @data ||= load(@path)
    end

    def get
      Gems.gems.inject({}) { |h, gem| h[gem['name']] = gem['downloads']; h }
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
