require 'pg'
class Bookmark

  def self.all
    connect_to_db
    result = @connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end  

  def self.add(url)
    connect_to_db
    result = @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

  private 

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test' 
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end 
