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

Whenever the notifier receives a get at `/fetch`, it performs the following:

1. `/path/to/application/forward_uri` contains linewise uris that will be called (to chain with notification systems, like hudson or redmine)
2. `/path/to/application/fetch_hook` will be executed in the directory containing the notifier directory (one level up)
