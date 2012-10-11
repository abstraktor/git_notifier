require 'sinatra'

PID_FILE = 'sinatra.pid'
# when running sinatra, its pid will be written to PID_FILE
# when quitting sinatra, its pidfile will be removed

class <<Sinatra::Base
        alias :old_quit! :quit!
        def quit!(*args)
                old_quit! *args
                File.delete PID_FILE
        end

        alias :old_run! :run!
        def run!(*args)
                File.open(PID_FILE, 'w') {|f| f.write Process.pid}
                old_run! *args
        end
end
