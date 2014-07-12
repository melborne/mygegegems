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
      _, gems = Stat.latest
      (date, t_date), diffs = Stat.diff(target)
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
          if diff = diffs[name]
            "%#{space1}d +%#{space2}d %s" % [dl, diffs[name], name]
          else
            none = "-".center(space2)
            "%#{space1}d  #{none} %s" % [dl, name]
          end
        end
      end

      def footer(total, diff_total, num_of_gems, space1, space2)
        "%#{space1}d +%#{space2}d %s gems" % [total, diff_total, num_of_gems]
      end
    end
  end  
end


__END__

As of 2014-07-11 (last: 2014-07-10)
-----------------------------------
3345   -  let_it_fall
2225 +100 togglate
 762   +2 emot
 354   +4 gh-diff
 299  +18 matreska
 297  +30 tildoc
-----------------------------------
7280 +154 6 gems
