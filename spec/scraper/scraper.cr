require "./../spec_helper"

describe Scraper do
  describe ".dance_report_url" do
    it "fills the number up to an 5 character long string" do
      Scraper.dance_report_url(1).should eq(
        "https://www.tanzsportverband.at/upload/turnierberichte/00001/index.htm"
      )
    end
  end

  describe ".scrape_event_ids!" do
    it "checks if a event id exists" do
      WebMock.stub(:get, "https://www.tanzsportverband.at/upload/turnierberichte/00000/index.htm")
      WebMock.stub(:get, "https://www.tanzsportverband.at/upload/turnierberichte/00001/index.htm")

      Mocks.create_mock Scraper do
        mock self.STOP_ID
      end

      allow(Scraper).to receive(STOP_ID).and_return(1)

      Scraper.scrape_event_ids!
    end
  end
end
