require "database_connection"

describe DatabaseConnection do

let (:test_db) {"bookmark_manager_test"}

  describe "#set up" do
    it "creates a new connection" do
      expect(PG).to receive(:connect).with(dbname: test_db)
      described_class.setup('bookmark_manager_test')
    end
  end

  describe "#query" do
    it "executes a SQL query on the selected database" do
      described_class.setup(test_db)
      # ask described class to tell us if it receives exec
      expect(described_class.database).to receive(:exec)
      # send exec to described class
      described_class.query("INSERT INTO links (url) VALUES('http://icescream.com')")
    end
  end

end