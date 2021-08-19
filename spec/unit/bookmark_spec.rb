require 'bookmark'

describe Bookmark do

  describe '.all' do

    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    
      bookmarks = Bookmark.all
    
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
    end
  end

  describe '.add' do
    it 'should add a string to the database' do 
      Bookmark.add('www.facebook.com')
    
      expect(Bookmark.all).to include "www.facebook.com" 
    end
  end

end