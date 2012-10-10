require 'sinatra'
require 'net/http'

set :port, 5050

get '/fetch' do
  # forward to all other listeners
  begin
    File.read('forward_uri').lines do |line|
      Net::HTTP.get URI(line)
    end
  rescue Net::HTTPBadResponse
  end

  system "./fetch_hook"
  "ok"
end
