require 'pg'
require_relative 'database_connection'

class Link

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def self.all
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # result = connection.exec 'SELECT * FROM links'
    result = DatabaseConnection.query('SELECT * FROM links')
     # result.map { |row| row['url'] }
     result.map { |link| Link.new(link['url']) }
  end

  def self.add(link)
    fail "Invalid link given" if url?(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{link}')")
    # connection = PG.connect dbname: 'bookmark_manager_' + ENV['RACK_ENV']
    # connection.exec "INSERT INTO links (url) VALUES('#{link}')"
  end

  def self.url?(link)
    link !~ /^http:\/\/www\..+\..+/
    # ^ = at the start of the url
  end
end
