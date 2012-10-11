require 'sinatra'
require 'net/http'

File.open('hpigit_notifier.pid', 'w') {|f| f.write Process.pid }

set :port, 5050

get '/fetch' do
	
	fork do
		# forward to all other listeners
		begin
		File.read('forward_uri').lines do |line|
			Net::HTTP.get URI(line.strip)
		end
		rescue Net::HTTPBadResponse => e
			puts e.inspect
		end
		system "./fetch_hook"
	end
end
