require 'pg'
require_relative 'database_connection'

class Link

  attr_reader :url, :id

  def initialize(id, url)
    @url = url
    @id = id
  end

  def self.all
   
    result = DatabaseConnection.query('SELECT * FROM links')
     result.map { |link| Link.new(link['id'],link['url']) }
  end

  def self.add(link)
    fail "Invalid link given" if url?(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{link}')")
    
  end

  def self.url?(link)
    link !~ /^http:\/\/www\..+\..+/
  end
end
