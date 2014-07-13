＃Mygegegems

<!--original
# Mygegegems
-->

あなたのgemsのダウンロード数をリポートします。

<!--original
Report download numbers of you gems.
-->

## インストール

<!--original
## Installation
-->

アプリケーションのGemfileに次の行を追加して、

<!--original
Add this line to your application's Gemfile:
-->

    gem 'mygegegems'


<!--original
    gem 'mygegegems'
-->

以下を実行するか、

<!--original
And then execute:
-->

    $ bundle


<!--original
    $ bundle
-->

ご自身で次のようにインストールします。

<!--original
Or install it yourself as:
-->

    $ gem install mygegegems


<!--original
    $ gem install mygegegems
-->

## 使い方

<!--original
## Usage
-->

Mygegegemsは、`mygegegems`ターミナルコマンドを持っています。

<!--original
Mygegegems has `mygegegems` terminal command.
-->

    % mygegegems help
    Commands:
      mygegegems help [COMMAND]  # Describe available commands or one specific command
      mygegegems stat            # Show stat of your gems
      mygegegems update          # Get latest stat from rubygems.org and update local database
      mygegegems version         # Show Mygegegems version


<!--original
    % mygegegems help
    Commands:
      mygegegems help [COMMAND]  # Describe available commands or one specific command
      mygegegems stat            # Show stat of your gems
      mygegegems update          # Get latest stat from rubygems.org and update local database
      mygegegems version         # Show Mygegegems version
-->

### updateタスク

<!--original
### update task
-->

`mygegegems update`は rubygems.orgからあなたのgemのダウンロードデータを取得し、ローカルデータベース（ `~.mygegegems.yaml`）を更新します。

<!--original
`mygegegems update` gets download data of your gems from rubygems.org and update local database(`~/.mygegegems.yaml`).
-->

### statタスク

<!--original
### stat task
-->

`mygegegems stat`はローカルデータベースからのダウンロードデータをプリントします。

<!--original
`mygegegems stat` prints download data from the local database:
-->

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


<!--original
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
-->

`stat`にはいくつかのオプションがあります。

<!--original
`stat` has some options:
-->

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



<!--original
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

-->

## Contributing

<!--original
## Contributing
-->

1. Fork it ( https://github.com/[my-github-username]/mygegegems/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

<!--original
1. Fork it ( https://github.com/[my-github-username]/mygegegems/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
-->

