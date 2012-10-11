require 'sinatra'
require 'httparty'

File.open('hpigit_notifier.pid', 'w') {|f| f.write Process.pid }

set :port, 5050

get '/fetch' do
	
	fork do
		# forward to all other listeners
		begin
		File.read('forward_uri').lines do |line|
			HTTParty.get line.strip
		end
		rescue HTTParty::ResponseError => e
			puts e.response.inspect
		end

		system "./fetch_hook"
	end
end
