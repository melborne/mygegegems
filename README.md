# Mygegegems

[![Build Status](https://travis-ci.org/melborne/mygegegems.svg?branch=master)](https://travis-ci.org/melborne/mygegegems)

Report download numbers of you gems.

## Installation

Add this line to your application's Gemfile:

    gem 'mygegegems'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mygegegems

## Usage

Mygegegems has `mygegegems` terminal command.

    % mygegegems help
    Commands:
      mygegegems help [COMMAND]  # Describe available commands or one specific command
      mygegegems stat            # Show stat of your gems
      mygegegems update          # Get latest stat from rubygems.org and update local database
      mygegegems version         # Show Mygegegems version

### update task

`mygegegems update` gets download data of your gems from rubygems.org and update local database(`~/.mygegegems.yaml`).

### stat task

`mygegegems stat` prints download data from the local database:

    % mygegegems stat
    As of 2014-07-13 (last: 2014-07-12)
    -----------------------------------
    14061 +1 gviz
     9349 +0 colorable
     7175 +0 flippy
     6173 +0 maliq
     4505 +0 hateda2md
     3345 +0 let_it_fall
     2784 +0 dir_friend
     2357 +0 yampla
     2225 +0 togglate
     1656 +0 ctoD
     1072 +0 gsub_filter
      977 +0 hatebu_entry
      762 +0 emot
      401 +0 money_exchange
      370 +0 itunes_track
      369 +3 gh-diff
      349 +0 sinatra_websocket_template
      301 +0 tildoc
      299 +0 matreska
       83  - mygegegems
    -----------------------------------
    58613 +4 20 gems

`stat` has some options:

    %mygegegems help stat
    Usage:
      mygegegems stat
    
    Options:
      -t, [--target=TARGET]          # Target to compare. any of 'last', 'last_month' or 'last_year'
                                     # Default: last
      -u, [--update], [--no-update]  # Update local data before showing stat
      -h, [--handle=HANDLE]          # Show stat of gems of a user with given handle
      -s, [--sort=SORT]              # Sort a list by given title. any of 'name', 'diff' or 'download'
                                     # Default: download
    
    Show stat of your gems


## Contributing

1. Fork it ( https://github.com/[my-github-username]/mygegegems/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
