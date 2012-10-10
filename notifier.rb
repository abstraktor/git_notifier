require 'sinatra'
require 'net/http'

set :port, 5050

get '/fetch' do
  # forward to all other listeners
  File.read('forward_uri').lines do |line|
    Net::HTTP.get URI(line)
  end

  system "./fetch_hook"
  "ok"
end
