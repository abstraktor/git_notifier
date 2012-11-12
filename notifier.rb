require 'sinatra'
require './sinatra/write_pid.rb'
require 'httparty'

set :port, 5050

path_prefix = ENV['NOTIFY_PATH'] || '.'

get '/fetch' do
	
	fork do
		# forward to all other listeners
		begin
		File.read(path_prefix+'/forward_uri').lines do |line|
			HTTParty.get line.strip
		end
		rescue HTTParty::ResponseError => e
			puts e.response.inspect
		end

		system "#{path_prefix}/fetch_hook"
	end
	200
end
