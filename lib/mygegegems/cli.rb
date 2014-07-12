require "thor"

module Mygegegems
  class CLI < Thor
    desc "update", "Get latest stat from rubygems.org and update local database"
    def update
      Mygegegems.update
      puts "Your gems data updated!(#{DATA_PATH})"
    rescue => e
      warn "Fail update process. #{e}"
      exit(1)
    end

    desc "stat", "Show stat of your gems"
    option :target, 
            aliases:'-t',
            default:'last',
            decs:"Target to compare. any of 'last', 'last_month' or 'last_year'"
    def stat
      target = options[:target].intern
      date, gems = Stat.latest
      (_, t_date), diffs = Stat.diff(target)
      total, diff_total, num_of_gems = Stat.total(target)
      space1, space2 = [total, diff_total].map { |t| t.to_s.size }
      header = header(date, t_date, target)
      puts header
      puts "-" * header.size
      puts body(gems, diffs, space1, space2)
      puts "-" * header.size
      puts footer(total, diff_total, num_of_gems, space1, space2)
    end

    no_tasks do
      def header(date1, date2, label)
        "As of #{date1} (#{label}: #{date2})"
      end

      def body(gems, diffs, space1, space2)
        gems = gems.sort_by { |_, dl| -dl }
        gems.map do |name, dl|
          if diffs && (diff = diffs[name])
            "%#{space1}d +%#{space2}d %s" % [dl, diffs[name], name]
          else
            none = "-".center(space2)
            "%#{space1}d  #{none} %s" % [dl, name]
          end
        end
      end

      def footer(total, diff_total, num_of_gems, space1, space2)
        if diff_total
          "%#{space1}d +%#{space2}d %s gems" % [total, diff_total, num_of_gems]
        else
          "%#{space1}d %s gems" % [total, num_of_gems]
        end
      end
    end
  end  
end
