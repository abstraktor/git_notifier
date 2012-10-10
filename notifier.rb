require 'sinatra'

set :port, 5050

get '/fetch' do
  system "./fetch_hook"
  "ok"
end
