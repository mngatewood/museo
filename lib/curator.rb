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

end