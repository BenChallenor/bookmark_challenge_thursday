require 'link'

describe Link do


  describe "#all" do
    it "returns all links wrapped in link instances" do
    p  links = Link.all
    # returns an array of test urls
    urls = links.map(&:url)
    expect(urls).to include("http://google.com")
    expect(urls).to include("http://facebook.com")
    end
    # it "returns a list of all links" do
    #   expect(described_class.all).to include "http://google.com"
    #   expect(described_class.all).to include "http://facebook.com"
    # end
  end

  describe "#add" do
    it "adds a link to the database" do
      Link.add("http://www.friedegg.com")
      p links = Link.all
       urls = links.map(&:url)
      expect(urls).to include("http://www.friedegg.com")
    end

    it "an error is raised when an invalid url is added" do
      expect { described_class.add("hello") }.to raise_error "Invalid link given"
    end
  end

end
