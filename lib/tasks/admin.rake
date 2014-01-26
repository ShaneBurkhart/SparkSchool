desc "Pings PING_URL to keep a dyno alive"
task :dyno_ping do
  require "net/http"
  if ENV['PING_URL']
    puts "Running upkeep ping!"
    uri = URI(ENV['PING_URL'])
    Net::HTTP.get_response(uri)
  else
    puts "No PING_URL found..."
  end
end
