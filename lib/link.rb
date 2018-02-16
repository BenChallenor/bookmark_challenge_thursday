require 'pg'
require_relative 'database_connection'

class Link

  attr_reader :url, :id, :title

  def initialize(id, url, title)
    @url = url
    @id = id
    @title = title
  end

  def self.all

    result = DatabaseConnection.query('SELECT * FROM links')
     result.map { |link| Link.new(link['id'],link['url'],link['title']) }
  end

  def self.add(link)
    return false unless url?(link[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{link[:url]}', '#{link[:title]}')" )

  end

  def self.url?(link)
    link =~ /^http:\/\/www\..+\..+/
  end
end
