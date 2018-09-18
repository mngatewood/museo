require './lib/photograph'
require './lib/artist'

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

end