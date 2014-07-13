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
            desc:"Target to compare. any of 'last', 'last_month' or 'last_year'"
    def stat
      target = options[:target].intern
      date, gems = Stat.latest
      (_, t_date), diffs = Stat.diff(target)
      total, diff_total, num_of_gems = Stat.total(target)
      space1, space2 = [total, diff_total].map { |t| t.to_s.size }
      header = header(date, t_date, target)
      border_line = "-" * real_size(header)

      puts header
      puts border_line
      puts body(gems, diffs, space1, space2)
      puts border_line
      puts footer(total, diff_total, num_of_gems, space1, space2)
    end

    no_tasks do
      def header(date1, date2, label)
        "As of #{date1} (#{label}: \e[33m#{date2}\e[0m)"
      end

      def body(gems, diffs, space1, space2)
        gems = gems.sort_by { |_, dl| -dl }
        gems.map do |name, dl|
          if diffs && (diff = diffs[name])
            "%#{space1}d \e[33m+%#{space2}d \e[32m%s\e[0m" % [dl, diffs[name], name]
          else
            none = "-".center(space2)
            "%#{space1}d  \e[33m#{none} \e[32m%s\e[0m" % [dl, name]
          end
        end
      end

      def footer(total, diff_total, num_of_gems, space1, space2)
        if diff_total
          "%#{space1}d \e[33m+%#{space2}d \e[32m%s gems\e[0m" % [total, diff_total, num_of_gems]
        else
          "%#{space1}d %s gems" % [total, num_of_gems]
        end
      end

      def real_size(str)
        str.gsub(/\e\[\d+m/, '').size
      end
    end
  end  
end
