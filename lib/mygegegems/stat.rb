module Mygegegems
  class Stat
    class << self
      def latest
        data.max_by { |date, _| date }
      end

      def last
        data.sort_by { |date, _| date }[-2]
      end
      alias :last_day :last

      def last_month
        latest_date, _ = latest
        data.select { |date, _| date.mon == latest_date.mon-1 }
            .max_by { |date, _| date }
      end
      alias :last_mon :last_month

      def last_year
        latest_date, _ = latest
        data.select { |date, _| date.year == latest_date.year-1 }
            .max_by { |date, _| date }
      end

      def data
        @data ||= load
      end

      private
      def load(path=DATA_PATH)
        YAML.load_file(path)
      rescue Errno::ENOENT
        warn "File not found: #{path}"
        exit(1)
      end
    end
  end
end