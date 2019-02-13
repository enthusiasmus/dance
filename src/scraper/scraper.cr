require "mysql"
require "crecto"
require "http/client"

require "./../models/event"
require "./../repo"
require "./../helpers/zero"

Crecto::DbLogger.set_handler(STDOUT)

class Scraper
  START_ID = 0
  STOP_ID = 10000
  URL = "https://www.tanzsportverband.at"

  def self.scrape_event_ids!
    puts "START"

    (START_ID..STOP_ID).each_with_index do |id, _|
      puts Zero.fill(id)

      next unless get(dance_report_url(id)).status_code == 200

      event = Event.new
      event.oetsv_report_id = id

      puts Repo.insert(event).errors
    end

    puts "FINISHED"
  end

  def self.dance_report_url(id : Int32)
    "#{URL}/upload/turnierberichte/#{Zero.fill(id)}/index.htm"
  end

  def self.get(url : String)
    HTTP::Client.get url
  end
end

Scraper.scrape_event_ids!
