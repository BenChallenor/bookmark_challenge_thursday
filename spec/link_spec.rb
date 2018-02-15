require 'link'

describe Link do


  describe "#all" do
    it "returns a list of all links" do
      expect(described_class.all).to include "http://google.com"
      expect(described_class.all).to include "http://facebook.com"
    end
  end

  describe "#add" do
    it "adds a link to the database" do
      described_class.add("http://www.friedegg.com")
      expect(described_class.all).to include "http://www.friedegg.com"
    end

    it "an error is raised when an invalid url is added" do
      expect { described_class.add("hello") }.to raise_error "Invalid link given"
    end
  end

end
