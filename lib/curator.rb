require './lib/photograph'
require './lib/artist'
require 'pry'

class Curator

  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(attributes)
    photograph = Photograph.new(attributes)
    @photographs << photograph
  end

  def add_artist(attributes)
    artist = Artist.new(attributes)
    @artists << artist
  end

  def find_artist_by_id(id)
    artists.find{|artist|artist.id == id}
  end

  def find_photograph_by_id(id)
    photographs.find{|photograph|photograph.id == id}
  end

  def find_photographs_by_artist(artist)
    photographs.find_all{|photograph|photograph.artist_id == artist.id}
  end

  def artists_with_multiple_photographs
    photos_by_artist = photographs.group_by{|photograph|photograph.artist_id}
    multiple_photos = photos_by_artist.find_all do |element|
      element.last.length > 1
    end
    artist_ids = multiple_photos.map{|element|element.first}
    artists_array = artist_ids.map{|id|find_artist_by_id(id)}
    return artists_array
  end

end