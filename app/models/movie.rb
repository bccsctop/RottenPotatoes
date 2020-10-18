class Movie < ActiveRecord::Base
  has_many :reviews
  class Movie::InvalidKeyError < StandardError ; end

  def self.find_in_tmdb(string)
    begin
      Tmdb::Movie.find(string)
    rescue Tmdb::InvalidApiKeyError
      raise Movie::InvalidKeyError, 'Invalid API key'
    end
  end

  def name_with_rating
    "#{self.title} (#{self.rating})"
  end
  
end