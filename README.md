git_notifier
============

a tiny git notification server written in sinatra

# installation

1. install [rvm](https://rvm.io/rvm/install/)
2. `git clone git@github.com:abstraktor/git_notifier.git`
3. `cd git_notifier`
4. `bundle`
5. `NOTIFY_PATH=/path/to/application ruby notifier.rb`

# usage

* `/path/to/application/fetch_hook` will be executed at notification
* `/path/to/application/forward_uri` contains linewise uris that will be called