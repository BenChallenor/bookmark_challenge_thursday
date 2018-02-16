require 'link'

describe Link do


  describe "#all" do
    it "returns all links wrapped in link instances" do
    p  links = Link.all
    # returns an array of test urls
    titles = links.map(&:title)
    expect(titles).to include("Google")
    expect(titles).to include("Facebook")
    end
    # it "returns a list of all links" do
    #   expect(described_class.all).to include "http://google.com"
    #   expect(described_class.all).to include "http://facebook.com"
    # end
  end

  describe "#add" do
    it "adds a link to the database" do
      Link.add(url: "http://www.friedegg.com", title: "Friedegg")
       links = Link.all
       urls = links.map(&:url)
      expect(urls).to include("http://www.friedegg.com")
    end

    it "does not create a new link if the url is not valid" do
      Link.add(url: 'fakelink')
      links = Link.all
      urls = links.map(&:url)
      expect(urls).not_to include "fakelink"
    end

    # it "an error is raised when an invalid url is added" do
    #   Link.add(url: "hello")
    #   links = Links.all
    #   urls = links.map(&:url)
    #   expect(urls).not_to include "hello"
    # end
  end

end
