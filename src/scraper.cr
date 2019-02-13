require "mysql"
require "crecto"
require "http/client"

require "./models/event"
require "./repo"
require "./helpers/zero"

Crecto::DbLogger.set_handler(STDOUT)

puts "START"

(0..10000).each_with_index do |i, _|
  puts Zero.fill(i)
  response = HTTP::Client.get "https://www.tanzsportverband.at/upload/turnierberichte/#{Zero.fill(i)}/index.htm"
  next unless response.status_code == 200
  event = Event.new
  event.oetsv_report_id = i
  changeset = Repo.insert(event)
  puts changeset.errors
end

puts "FINISHED"
