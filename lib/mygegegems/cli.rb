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
    option :update,
            aliases:'-u',
            default:false,
            type: :boolean,
            desc:"Update local data before showing stat"
    option :handle,
            aliases:'-h',
            desc:"Show stat of gems of a user with given handle"
    option :sort,
            aliases:'-s',
            default:'download',
            desc:"Sort a list by given title. any of 'name', 'diff' or 'download'"
    def stat
      if handle = options[:handle]
        gems = Mygegegems.gems(handle)
        header = "#{handle}'s gems"
        border_line = "-" * 30
        total = gems.inject(0) { |sum, (_, dl)| sum + dl }
        num_of_gems = gems.size
        body = body(gems, {}, total.to_s.size, 3, options[:sort])
        footer = footer(total, nil, gems.size)
      else
        invoke(:update, [], {}) if options[:update]

        target = options[:target].intern
        date, gems = Stat.latest
        (_, t_date), diffs = Stat.diff(target)
        total, diff_total, num_of_gems = Stat.total(target)
        space1, space2 = [total, diff_total].map { |t| t.to_s.size }
        header = header(date, t_date, target)
        border_line = "-" * real_size(header)
        body = body(gems, diffs, space1, space2, options[:sort])
        footer = footer(total, diff_total, num_of_gems, space1, space2)
      end

      puts header
      puts border_line
      puts body
      puts border_line
      puts footer
    end

    desc "version", "Show Mygegegems version"
    def version
      puts "Mygegegems #{Mygegegems::VERSION} (c) 2014 kyoendo"
    end
    map "-v" => :version

    no_tasks do
      def header(date1, date2, label)
        line = "As of #{date1} (#{label}: #{date2})"
        line.colco(:yellow, regexp:/(?<=\s)\S+(?=\)$)/)
      end

      def body(gems, diffs, space1, space2, sort)
        gems.map { |name, dl|
              diff = diffs && diffs[name] || -1
              [dl, diff, name]
            }.sort_by { |arr|
              case sort.intern
              when :download then -arr[0]
              when :diff     then -arr[1]
              when :name     then arr[2]
              else -arr[0]
              end
            }.map { |dl, diff, name|
              if diff >= 0
                line = "%#{space1}d +%#{space2}d %s" % [dl, diff, name]
                re = /\+\s*\d+|\S+/
                line.colco(nil, :yellow, :green, regexp:re)
              else
                none = "-".center(space2)
                line = "%#{space1}d  #{none} %s" % [dl, name]
                line.colco(nil, :yellow, :green)
              end
            }
      end

      def footer(total, diff_total, num_of_gems, space1=0, space2=0)
        if diff_total
          line = "%#{space1}d +%#{space2}d %s gems" % [total, diff_total, num_of_gems]
          line.colco(nil, :yellow, :green, :green)
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
