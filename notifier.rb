require 'sinatra'
require './sinatra/write_pid.rb'
require 'httparty'

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
	200
end
